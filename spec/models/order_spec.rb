require 'rails_helper'

RSpec.describe Order, type: :model do
  describe Order do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep(0.5)
    end
    
    describe '購入情報の登録' do
      context '購入情報の登録がうまくいくとき' do
        it 'tokenと必須項目がすべて正しく入力されていれば保存できる' do
          expect(@order).to be_valid
        end
        it 'billが空でも保存ができる' do
          @order.bill = ''
          expect(@order).to be_valid
        end
      end

      context '購入情報の登録がうまくいかないとき' do
        it 'tokenが空だと保存できない' do
          @order.token = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空だと保存できない' do
          @order.user_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @order.item_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Item can't be blank")
        end
        it 'postal_codeが空だと保存できない' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
        end
        it 'postal_codeが全角文字だと保存できない' do
          @order.postal_code = 'あああああああ'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
        end
        it 'postal_codeが半角英字のみだと保存できない' do
          @order.postal_code = 'aaaaaaa'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
        end
        it 'postal_codeが半角英数混合だと保存できない' do
          @order.postal_code = 'abc1234'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
        end
        it 'postal_codeがハイフンなしだと保存できない' do
          @order.postal_code = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
        end
        it "delivery_area_idが１のときは登録できない" do
          @order.delivery_area_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include("Delivery area must be other than 1")
        end
        it 'cityが空だと保存できない' do
          @order.city = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank", "City is invalid")
        end
        it 'cityが半角英数混合だと保存できない' do
          @order.city = 'abc123'
          @order.valid?
          expect(@order.errors.full_messages).to include("City is invalid")
        end
        it 'cityが半角英字のみだと保存できない' do
          @order.city = 'abc'
          @order.valid?
          expect(@order.errors.full_messages).to include("City is invalid")
        end
        it 'cityが半角数字のみだと保存できない' do
          @order.city = '123'
          @order.valid?
          expect(@order.errors.full_messages).to include("City is invalid")
        end
        it 'addressが空だと保存できない' do
          @order.address = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと保存できない' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it 'phone_numberが全角文字だと保存できない' do
          @order.phone_number = 'あああああああああああ'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが半角英字だと保存できない' do
          @order.phone_number = 'aaaaaaaaaaa'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが半角英数混合だと保存できない' do
          @order.phone_number = 'abc12345678'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが12桁以上だと保存できない' do
          @order.phone_number = '123456789012'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
      end
    end
  end
end
