module Response
  def json_response(object, status = :true)
    render json: object, status: status
  end
end
