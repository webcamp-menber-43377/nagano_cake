class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    ## カートに入ってる商品の合計金額
    @total = 0
  end

  ## カート商品を追加・保存
  def create
    # binding.pry
    @cart_item = current_customer.cart_items.new(cart_item_params)

    ## 1. 追加した商品がカート内に存在するかの判別
          ##元々カート内にあるもの「item_id」
          ##今追加した  params[:cart_item][:item_id]
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      ## 存在した場合
        ## 2. カート内の個数をフォームから送られた個数分追加する
        ## もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
      ##cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      ##.to_iとして数字として扱う
      cart_item.amount += params[:cart_item][:amount].to_i

      cart_item.save
      redirect_to cart_items_path
    elsif
      ## 存在しなかった場合
        ## カートモデルにレコードを新規作成する
        ## もしカート内に「同じ」商品がない場合は通常の保存処理
      @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    else
      # 保存できなかった場合
      redirect_to cart_items_path
    end
  end

  def update
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
