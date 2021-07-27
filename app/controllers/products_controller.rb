class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show] 
  before_action :set_product, only: [:update,:edit,:show,:destroy]
  before_action :move_to_index, except: [:new,:create,:index, :show]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

 def destroy
  @product.destroy
  redirect_to root_path
end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(params[:id])
      else
        render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:image,:product_name, :product_description,:category_id , :product_condition_id,:shipping_charge_id,:prefecture_id,:days_to_ship_id,:selling_price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  


  def move_to_index
    if current_user.id != @product.user.id || @product.purchase.present?
      # 「もし投稿者とログインしているユーザーが違う場合」
      redirect_to action: :index
    end
  end
end
