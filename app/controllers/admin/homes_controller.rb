class Admin::HomesController < ApplicationController
  def top
    @order_details = OrderDetails.all
  end
end
