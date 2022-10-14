class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
    # @address = Address.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
  end

  def index
  end

  def show
  end

  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  # def address_params
  #   params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  # end
end
