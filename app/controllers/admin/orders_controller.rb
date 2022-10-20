class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
  end
end
