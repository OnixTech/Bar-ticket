class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
