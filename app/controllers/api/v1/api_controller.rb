class Api::V1::ApiController < ActionController::API
  # before_action :set_agent
  include Response
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  
  respond_to :json

  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  serialization_scope :view_context

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      @current_user ||= user if user
    end
  end

  def authenticate
    render json: {success: false, error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def default_serializer_options
    {root: false}
  end

  def api_exception_handler(exception)
    @errors = []
    @errors << exception.message
    @response[:code] = 0
  end

  private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end

  def record_not_found
    render json: { success: false, message: 'Resource not found.' }
  end
end