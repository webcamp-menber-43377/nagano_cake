class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer
    if @address.save
      redirect_to addresses_path, notice: 'You have created book successfully.'
    else
      @addresses = Address.all
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private

  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
