class OrdersController < ApplicationController
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  def create
    puts params.inspect
    render json: params
  end
end
