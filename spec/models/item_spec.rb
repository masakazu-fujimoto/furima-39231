require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空だと出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'description_of_itemが空だと出品できない' do
        @item.description_of_item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end
      it 'product_categoryが未選択だと出品できない' do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it 'commodity_conditionが未選択だと出品できない' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commodity condition can't be blank")
      end
      it 'shipping_chargeが未選択だと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'region_of_originが未選択だと出品できない' do
        @item.region_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'days_of_shipが未選択だと出品できない' do
        @item.days_of_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days of ship can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300よりすくないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥99999999より多い出品できない' do
        @item.price = 999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
