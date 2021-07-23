require 'rails_helper'

RSpec.describe PurchaseLocation, type: :model do
before do
     user= FactoryBot.create(:user)
     product = FactoryBot.create(:product)
      @purchase_location = FactoryBot.build(:purchase_location, user_id: user.id,product_id: product.id)

      sleep(1)
 end

 context 'ユーザ登録ができる時' do
  it '全ての情報があれば登録できる'  do
    expect(@purchase_location).to be_valid
  end
end

context 'ユーザ登録ができない時' do
    it '郵便番号が必須であること。' do
      @purchase_location.postal_code  = ''
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567 良くない例：1234567）。' do
      @purchase_location.postal_code = "1234567"
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages
      ).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県が必須であること。' do
      @purchase_location.prefecture_id  = ''
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が必須であること。' do
      @purchase_location.municipality  = ''
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が必須であること。' do
      @purchase_location.address  = ''
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Address can't be blank") 
    end

    it '建物名がないこと。'do
    @purchase_location.building_name = ''
    expect(@purchase_location).to be_valid
  end

    it '電話番号が必須であること。' do
      @purchase_location.phone_number  = ''
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Phone number can't be blank") 
    end

    it '電話番号は、10桁未満の半角数値のみ保存可能ではない' do
      @purchase_location.phone_number = "123456789"
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages
      ).to include("Phone number is too short (minimum is 10 characters)")
    end
  
    it '電話番号は、11桁以上の半角数値のみ保存可能ではない' do
      @purchase_location.phone_number = "123456789101"
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages
      ).to include("Phone number is too long (maximum is 11 characters)")
    end

    it '電話番号は、数値以外の値が入力された場合購入できない' do
      @purchase_location.phone_number  = 'freqwerff'
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Phone number is not a number")
    end

    it 'token がnilの場合購入できない' do
      @purchase_location.token   = nil
      @purchase_location.valid?
      expect(@purchase_location.errors.full_messages).to include("Token can't be blank")
  end

  it 'user_id がnilの場合購入できない' do
    @purchase_location.user_id = nil
    @purchase_location.valid?
    expect(@purchase_location.errors.full_messages).to include("User can't be blank")
end

it 'product_id がnilの場合購入できない' do
  @purchase_location.product_id  =nil
  @purchase_location.valid?
  expect(@purchase_location.errors.full_messages).to include("Product can't be blank")
end
end
end
