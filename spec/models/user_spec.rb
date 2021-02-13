require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての項目が入力され、存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end
  
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが５文字以下であれば登録できない" do
          @user.password = "a1234"
          @user.password_confirmation = "a1234"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが全角英数であれば登録できない" do
          @user.password = "あ１い２う"
          @user.password_confirmation = "あ１い２う"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "last_nameが半角であれば登録できない" do
          @user.last_name = "a1a2a3"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it "first_nameが半角であれば登録できない" do
          @user.first_name = "a1a2a3"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "last_name_kanaが半角であれば登録できない" do
          @user.last_name_kana = "a1a2a3"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it "first_name_kanaが半角であれば登録できない" do
          @user.first_name_kana = "a1a2a3"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "last_name_kanaが半角カナであれば登録できない" do
          @user.last_name_kana = "ｱｶｻﾀﾅ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it "first_name_kanaが半角カナであれば登録できない" do
          @user.first_name_kana = "ｱｶｻﾀﾅ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
      end
    end
  end
end
