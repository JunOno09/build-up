require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべての項目の入力があれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールを入力してください")
      end
      it "emailが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します", "Eメールはすでに存在します")
      end
      it "emailに@が含むこと" do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a2345"
        @user.password_confirmation = "a2345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "a23456"
        @user.password_confirmation = "a234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは英語のみではと登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは数字ののみでは登録できないこと" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは全角では登録できないこと" do
        @user.password = "パスワード１"
        @user.password_confirmation = "パスワード１"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "family_nameがない場合は登録できないこと" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字は不正な値です")
      end
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      it "family_name_kanaがない場合は登録できないこと" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください", "名字（カナ）は不正な値です")
      end
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）は不正な値です")
      end
      it "brith_dayがない場合は登録できないこと" do
        @user.birth_day= nil
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'family_nameが全角入力でなければ登録できないこと' do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.family_name_kana =  "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）は不正な値です")
      end
      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana =  "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
    end
  end
  
end
