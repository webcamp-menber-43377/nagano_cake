class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end


  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
