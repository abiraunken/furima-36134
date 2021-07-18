require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題ない場合' do
    it '全ての情報があれば登録できる' do
        expect(@user).to be_valid
    end
end
    
context '内容に問題がある場合' do
  it 'ニックネームが必須であること。' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
  end
  
      it 'メールアドレスが必須であること。' do
        @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'kkkooooo'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

        it 'パスワードが必須であること。' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
    
        it 'パスワードは、6文字以上での入力が必須であること' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
    
        it 'パスワードは、半角英数字混合での入力が必須であること' do
          @user.password = 'F９JIJ０'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（数字のみで通らないこと）' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('"Password には英字と数字の両方を含めて設定してください ')
      end
      
      it 'パスワードは、半角英字混合での入力が必須であること（英字のみで通らないこと）' do
        @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字が必須であること。' do
      @user.kanji_first_name=''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kanji first name 全角文字を使用してください")
    end

    it 'お名前(全角)は、名前が必須であること' do
      @user.kanji_last_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji last name 全角文字を使用してください")
    end

    it 'お名前は半角（名字）では通らない' do
      @user.kanji_first_name= "aa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Kanji first name 全角文字を使用してください")
    end

    it 'お名前は半角（名前）では通らない' do
      @user.kanji_last_name= "aa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Kanji last name 全角文字を使用してください")
    end

    it 'お名前は全角（名字）カタカナ以外では通らない' do
      @user.katakana_first_name="aa" 
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakana first name 全角カタカナを使用してください")
    end

    it 'お名前は全角（名前）カタカナ以外では通らない' do
      @user.katakana_last_name= "aa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakana last name 全角カタカナを使用してください")
    end

    it 'お名前は全角（名字)ひらがなでは通らない' do
      @user.katakana_first_name="ささき" 
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakana first name 全角カタカナを使用してくださ")
    end

    it 'お名前は全角（名前）ひらがなでは通らない' do
      @user.katakana_last_name= "ゆうだい"
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakana last name 全角カタカナを使用してください")
    end


it 'お名前カナ(全角)は、全角（カタカナ）での名字入力が必須であること。' do
  @user.katakana_first_name= ''
@user.valid?
expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
end

it 'お名前カナ(全角)は、全角（カタカナ）での名前入力が必須であること。' do
  @user.katakana_last_name= ''
@user.valid?
expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
end

it '生年月日が必須であること。' do
  @user.birthday = ''
@user.valid?
expect(@user.errors.full_messages).to include("Birthday can't be blank")
end
end
