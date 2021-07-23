class PurchaseLocation 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id,:product_id,:token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :postal_code
    validates :prefecture_id
    validates :municipality 
    validates :address
    validates :phone_number,numericality: {only_integer: true},length: {minimum:10, maximum:11}
  validates :token
  validates :product_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Location.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality:  municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)

    
    
  end
end

