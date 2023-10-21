class OrdersController < ApplicationController
  def new
    skip_authorization
    @order = session[:order]
    @order["content"] = format_order_content(@order["content"])
    create
  end

  def create
    order = Order.new(@order)
    if order.save
      ActionCable.server.broadcast(
        "order_#{order.station_id}",
        { 
          action: "created"
        }
      )
      if current_user.present?
        sign_out(current_user)
      end
    end
  end

  def delete
  end

  private

  def order_params
    params.require(:order).permit(:table, :content, :total, :number, :station_id)
  end
 
  def format_order_content(content)
    str = ""
    content.each do |item|
      str += "• #{item["quantity"]}x #{item["name"]} €#{item["price"]}\n"
    end
    str
  end
end
