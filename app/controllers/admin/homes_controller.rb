class Admin::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.page(params[:page])
  end

  private
  # ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end
