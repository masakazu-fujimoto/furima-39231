require 'rails_helper'

RSpec.describe PurchasingShippingAddress, type: :model do
  describe '購入情報入力' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)     
      @purchasing_shipping_address = FactoryBot.build(:purchasing_shipping_address, user_id: @user.id, item_id: @item.id)
      
    end

    context '内容に問題ない場合' do
      it '購入できる' do
        expect(@purchasing_shipping_address).to be_valid
      end
      it 'buildingが空でも購入できること' do
        @purchasing_shipping_address.building = ''
        expect(@purchasing_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空白だと購入できない' do
        @purchasing_shipping_address.user_id = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空白だと購入できない' do
        @purchasing_shipping_address.item_id = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @purchasing_shipping_address.post_code = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが『3桁ハイフン4桁』でないと購入できない' do
        @purchasing_shipping_address.post_code = '1234-567'
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが半角数字でないと購入できない' do
        @purchasing_shipping_address.post_code = '１２３-４５６７'
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'region_of_originが未選択だと購入できない' do
        @purchasing_shipping_address.region_of_origin_id = 1
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'municipalitiesが空白だと購入できない' do
        @purchasing_shipping_address.municipalities = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空白だと購入できない' do
        @purchasing_shipping_address.address = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空白だと購入できない' do
        @purchasing_shipping_address.telephone_number = ''
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと購入できない' do
        @purchasing_shipping_address.telephone_number = '123456789'
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上だと購入できない' do
        @purchasing_shipping_address.telephone_number = '123456789012'
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数字以外購入できない' do
        @purchasing_shipping_address.telephone_number = "！あア亜"
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できない" do
        @purchasing_shipping_address.token = nil
        @purchasing_shipping_address.valid?
        expect(@purchasing_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end  
  end     
end