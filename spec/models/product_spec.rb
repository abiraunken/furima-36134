require 'rails_helper'

RSpec.describe Product, type: :model do
before do
  @product = FactoryBot.build(:product)
end

  it '商品画像を1枚つけることが必須であること。' do
    @product.image = nil
  @product.valid?
  expect(@product.errors.full_messages).to include("Image can't be blank")
  end
  
  it '商品名が必須であること。' do
    @product.product_name  = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Product name can't be blank")
  end
  
  it '商品の説明が必須であること。' do
    @product.product_description= ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Product description can't be blank")
  end
  
  it 'カテゴリーの情報が必須であること。' do
    @product.category_id = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Category can't be blank")
  end
  
  it '商品の状態の情報が必須であること。' do
    @product.product_condition_id = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Product condition can't be blank")
  end
  
  it '配送料の負担の情報が必須であること。' do
    @product.shipping_charge_id  = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
  end
  
  
  it '発送元の地域の情報が必須であること。' do
    @product.prefecture_id = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Prefecture can't be blank")
  end
  
  it '発送までの日数の情報が必須であること。' do
    @product.days_to_ship_id = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Days to ship can't be blank")
  end
  
  
  it '価格の情報が必須であること。' do
    @product.selling_price = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Selling price can't be blank")
  end
  
  it '価格は、¥300より少ない時には出品できない
  価格は半角数値のみ保存可能であること。'do
  @product.selling_price = 299
  @product.valid?
  expect(@product.errors.full_messages
  ).to include("Selling price must be greater than or equal to 300")
  end

  it '価格は、¥9,999,999より多い時は出品できない
  価格は半角数値のみ保存可能であること。'do
  @product.selling_price = 10000000
  @product.valid?
  expect(@product.errors.full_messages
  ).to include("Selling price must be less than or equal to 9999999")
  end
  
  it '価格は半角数値のみ保存可能であること。' do
    @product.selling_price = '５４３'
    @product.valid?
    expect(@product.errors.full_messages).to include("Selling price is not a number")
  end
  
end

