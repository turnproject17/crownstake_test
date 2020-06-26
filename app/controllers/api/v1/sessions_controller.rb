class ::Api::V1::SessionsController < Devise::SessionsController

  skip_before_action :verify_authenticity_token

  def create
    user = User.where(["lower(email) = :value", {value: auth_params[:login].strip.downcase}]).first
    unless user.blank?
      if user.valid_password?(auth_params[:password])
        sign_in(:user, user)
        jwt = Auth.issue({user: user.id})
        render json: {  success: true,
                        authorization: {
                          access_token: jwt,
                          type: 'Bearer'
                        },
                        user: ActiveModelSerializers::SerializableResource.new(user)
                      }
      else
        render json: {
            success: false,
             message: 'Invalid Login or Password',
           }
      end
    else
      render json: {
            success: false,
            message: "User not found."
          }
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: { 
      success: true,
      message: "Signed out successfully!"
    }
  end

  private
    def auth_params
      params.require(:auth).permit(:login, :password)
    end

end