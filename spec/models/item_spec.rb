require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品データの保存' do
    context '内容に問題がない場合' do
      it 'image,title,description,price,category_id,state_id,delivery_price_id,derivery_date_id,prefecture_idが入力されている場合' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では保存できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it '配送料の負担が空では保存できない' do
        @item.delivery_price_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end
      it '発送元の地域が空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が空では保存できない' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格が300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be an integer"
      end
    end
  end
end
