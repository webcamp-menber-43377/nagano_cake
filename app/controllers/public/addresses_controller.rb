class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    # @address.customer_id = current_customer
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: 'You have created book successfully.'
    else
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    # if @address.customer_id != current_customer.id
    #   redirect_to addresses_path
    # end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path(@address.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
