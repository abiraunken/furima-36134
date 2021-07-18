class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :days_to_ship
#空の投稿を保存できないようにする
with_options presence: true do
validates :product_name
validates :product_description
validates :category_id
validates :product_condition_id
validates :shipping_charge_id
validates :product_condition_id
validates :prefecture_id
validates :days_to_ship_id
validates :selling_price
end
validates :selling_price, numericality: {only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}



#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end