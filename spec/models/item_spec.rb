require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '出品する商品の新規登録' do
      context '商品登録がうまくいくとき' do
        it "全ての項目が入力され、存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end
  
      context '商品登録がうまくいかないとき' do
        it "imageが空では登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "product_nameが空では登録できない" do
          @item.product_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end
        it "product_nameが41文字以上では登録できない" do
          aaa = "a"*41
          @item.product_name = aaa
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
        end
        it "product_descriptionが空では登録できない" do
          @item.product_description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end
        it "product_descriptionが1,001文字以上では登録できない" do
          bbb = "b"*1001
          @item.product_description = bbb
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description is too long (maximum is 1000 characters)")
        end
        it "category_idが１のときは登録できない" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "product_condition_idが１のときは登録できない" do
          @item.product_condition_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition must be other than 1")
        end
        it "delivery_fee_idが１のときは登録できない" do
          @item.delivery_fee_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it "delivery_area_idが１のときは登録できない" do
          @item.delivery_area_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
        end
        it "delivery_day_idが１のときは登録できない" do
          @item.delivery_day_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
        end
        it "priceが空では登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "priceが299以下では登録できない" do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 299")
        end
        it "priceが10000000以上では登録できない" do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
      end
    end
  end
end
