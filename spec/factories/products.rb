FactoryBot.define do
  factory :product do
    product_name             {"test"}
    product_description       {"説明"}      
    category_id  {3}
    product_condition_id {3}
    shipping_charge_id{3}
    prefecture_id {3}
    days_to_ship_id {2}
    selling_price {3000}
    association :user 

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png')
    end
  end
end
