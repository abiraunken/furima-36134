require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

it 'ニックネームが必須であること。' do
        expect(@user).to be_valid
  end
  
      it 'メールアドレスが必須であること。' do
        @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'メールアドレスが一意性であること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

        it 'パスワードが必須であること。' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
    
        it 'パスワードは、6文字以上での入力が必須であること' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
    
        it 'パスワードは、半角英数字混合での入力が必須であること
        ' do
          @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('"Password has already been taken')
    end
  end
end
