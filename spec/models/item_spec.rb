require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が登録できる場合' do
      it "name, text, price, category_id, condition_id, postage_payer_id,
        prefecture_id, preparation_days_id, image, user_id があれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が登録できない場合' do
      it 'name がなければ登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'text がなければ登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'price がなければ登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'price が整数でなければ登録できない' do
        @item.price = Random.rand(300.0..9_999_998.9)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be an integer'
      end
      it 'price が300未満では登録できない' do
        @item.price = Random.rand(300)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'price が9,999,999より大きければ登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'category_id が0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'condition_id が0では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 0'
      end
      it 'postage_payer_id が0では登録できない' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Postage payer must be other than 0'
      end
      it 'prefecture_id が0では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it 'preparation_days_id が0では登録できない' do
        @item.preparation_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Preparation days must be other than 0'
      end
      it '紐づくimage がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '紐づくuser がなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
