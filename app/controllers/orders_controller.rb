class OrdersController < ApplicationController
  def new
    skip_authorization
    @order = session[:order]
    session.delete(:order)
    @order["content"] = format_order_content(@order["content"])
    create
  end

  def create
    order = Order.new(@order)
    if order.save
      ActionCable.server.broadcast("order_1", { action: "created"})
    end
  end

  def delete
  end

  private

  def order_params
    params.require(:order).permit(:table, :content, :number, :station_id)
  end
 
  def format_order_content(content)
    str = ""
    content.each do |item|
      str += "• #{item["quantity"]}x #{item["name"]} #{item["price"]}\n"
    end
    str
  end
end
