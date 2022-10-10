class Public::CartItemsController < ApplicationController
  def index
    # @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_items = current_customer.cart_items.all
    ## カートに入ってる商品の合計金額
    @total=0
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  ## カート商品を追加・保存
  def create
    # binding.pry
    # @item = Item.find(cart_item_params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_item.customer_id = current_customer.id
    # @cart_item.item_id = params(:id)
    ## もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
      ##元々カート内にあるもの「item_id」
      ##今追加した  params[:cart_item][:item_id]
    # if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    #   ##cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
    #   ##.to_iとして数字として扱う
    #   cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #   cart_item.quantity += params[:cart_item][:quantity].to_i

    #   cart_item.save
    #   redirect_to cart_items_path

    ## もしカート内に「同じ」商品がない場合は通常の保存処理
    @cart_item.save
    @cart_items = current_customer.cart_items.all
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  # ストロングパラメータ
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
