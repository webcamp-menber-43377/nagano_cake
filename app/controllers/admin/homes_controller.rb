class Admin::HomesController < ApplicationController
  def top
    # @order_details = OrderDetail.page(params[:page])
    @orders = Order.all
    @orders_page = Order.page(params[:page])
  end

  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  # def order_detail_params
  #   params.require(:order_detail).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  # end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
