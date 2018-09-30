class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create]
    
  def create
  end

  def index
    @orders= []
    @allOrders = Order.all
    @allOrders.each do |order|
        pizzas = []
        @orderlines=Orderline.where(order: order)
        @orderlines.each do |orderline|
            pizza = Pizza.find(orderline[:pizza_id])
            pizzas.push(pizza)
        end
      p "orders "
      @orders.push({order: order ,pizzas: pizzas})
      p pizzas
    end
  end
end
