class OrdersController < ApplicationController
  def new
    skip_authorization
    orders = session[:orders]
    orders.each do |order|
      order["content"] = format_order_content(order["content"])
      create(order)
    end
    session.delete(:orders)
    if current_user.present?
      sign_out(current_user)
    end
  end

  def create(order)
    new_order = Order.new(order)
    if new_order.save
      ActionCable.server.broadcast(
        "order_#{new_order.station_id}",
        { 
          action: "created"
        }
      )
    end
  end

  def delete
  end

  private
   
  def format_order_content(content)
    str = ""
    content.each do |item|
      str += "• #{item["quantity"]}x #{item["name"]} €#{item["price"]}\n"
    end
    str
  end
end
