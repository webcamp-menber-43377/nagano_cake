class Admin::OrdersController < ApplicationController
  def show
    # @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    # @order_detail = OrderDetail.find(params[:id])
  end

  def update
  end

  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
