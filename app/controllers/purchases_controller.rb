class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @product = Product.find(params[:product_id])
    @purchase_location= PurchaseLocation.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_location = PurchaseLocation.new(purchase_params)
    if @purchase_location.valid?
      pay_item
      @purchase_location.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def purchase_params
    params.require(:purchase_location).permit(:postal_code,:phone_number,:prefecture_id,:building_name, :prefecture_id , :municipality , :house_number, :building_name,:address).merge(user_id: current_user.id,product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.selling_price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end