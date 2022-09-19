class Admin::OrderDetailsController < ApplicationController
  def update
    @customer = Customer.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(item_params)
      redirect_to admin_order_detail_path(@order_detail.id)
    else
      render :update
    end
  end



  private
  # ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:id, :order_id, :item_id, :price, :amount, :making_status)
  end

end
