class ProductsController < ApplicationController
before_action :authenticate_user!,except: [:index,:show] 

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
  @product = Product.find(params[:id])
end

def show
   @product = Product.find(params[:id])
 end

 def update
  product = Product.find(params[:id])
  product.update(product_params)
end

private
def product_params
  params.require(:product).permit(:image,:product_name, :product_description,:category_id , :product_condition_id,:shipping_charge_id,:prefecture_id,:days_to_ship_id,:selling_price).merge(user_id: current_user.id)
end

end
