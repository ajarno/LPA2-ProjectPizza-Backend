class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create]
    
  def create
    p "ordersController"
    @nom = params[:name]
    @adresse = params[:adress]
    p @adresse
    @pizzas = params[:pizzas]
    newOrder = Order.new(:name => @name, :adress => @adress)
    newOrder.save
    p @pizzas
    @erros="Erros : [";
    @pizzas.each do |pizza|
	    @orderPizza =Pizza.where(name: pizza).first
	    if @orderPizza.nil?
	        @erros= @erros+" - There is no pizza with name = " + pizza
	        p @erros
	    next
        end
        p @orderPizza
        newOrderline = Orderline.new
        newOrderline.order = newOrder
        newOrderline.pizza = @orderPizza
        newOrderline.save
    end
    @erros = @erros + "]"
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
