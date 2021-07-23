class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :selling_price
    
    end
validates :selling_price, numericality: {only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}



validates :category_id,:product_condition_id,
:shipping_charge_id,
:prefecture_id,
:days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
end