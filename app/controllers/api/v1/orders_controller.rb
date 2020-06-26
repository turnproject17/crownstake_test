class ::Api::V1::OrdersController < Api::V1::ApiController
  before_action :current_order
  def show
    json_response(ActiveModelSerializers::SerializableResource.new(current_order, adapter: :json).as_json, 200)
  end

  def update
    if current_order.update(order_params)
      json_response({success: true}, 200) 
    else
      json_response({message: current_order.errors.full_messages.join(', ')}, :false) 
    end
  end

  private

  def current_order
    @order = current_user.current_order
  end

  def order_params
    params.require(:order).permit(line_items_attributes: [:id, :product_id, :quantity, :_destroy])
  end
end