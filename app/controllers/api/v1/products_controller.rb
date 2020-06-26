class ::Api::V1::ProductsController < Api::V1::ApiController
  def index
    @products = Product.all
    json_response(ActiveModelSerializers::SerializableResource.new(@products, adapter: :json).as_json, 200)
  end
end