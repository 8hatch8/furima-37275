require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname, email, password, password_confirmation, family_name,first_name,
          family_name_kana, first_name_kana, birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameがなければ登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailがすでに存在すれば登録できない' do
        @another_user = FactoryBot.create(:user)
        @user.email = @another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@が含まれなければ登録できない' do
        email = @user.email
        @user.email = email.delete('@')
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordがなければ登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが５文字以下なら登録できない' do
        @user.password = 'a2345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordに英字が含まれなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password 英字と数字の両方を含めて設定してください'
      end
      it 'passwordに数字が含まれなければ登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password 英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameがなければ登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'family_nameが全角でなければ登録できない' do
        @user.family_name = 'family'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name 全角文字を使用してください'
      end

      it 'first_nameがなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'first'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end

      it 'family_name_kanaがなければ登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'family_name_kanaが全角カタカナでなければ登録できない' do
        @user.family_name_kana = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end

      it 'first_name_kanaがなければ登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
    end
  end
end
