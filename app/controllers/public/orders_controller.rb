class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = 0

    @order = Order.new(order_params)
    if params[:order][:address_option] == '0'
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_option] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == '2'
      @address = Address.new
      @address.address = params[:order][:address]
      @address.postal_code = params[:order][:postal_code]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id
      if @address.save
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      else
        render :new
      end
    end

    if @order.save
      redirect_to orders_complete_path
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
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
end
