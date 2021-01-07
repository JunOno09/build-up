require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end
  describe '練習記録投稿' do
    context '記録投稿がうまくいくとき' do
      it "すべての項目の入力があれば出品できる" do
         expect(@record).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "ユーザーが紐付いていないと投稿できない" do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Userを入力してください")
      end
      it "商品画像を1枚ないと投稿できない" do
        @record.image = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("画像を入力してください")
      end
      it "TRテーマがないと投稿できない" do
        @record.tr_theme = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("練習のテーマを入力してください")
      end
      it "TRの説明・感想がないと投稿できない" do
        @record.tr_content = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("練習の説明や感想を入力してください")
      end
      it "カテゴリーの情報がないと投稿できない" do
        @record.category_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーは数値で入力してください")
      end
      it "カテゴリーIDが1のときは投稿できない" do
        @record.category_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "練習の評価についての情報がないと投稿できない" do
        @record.evaluation_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("練習の評価を入力してください", "練習の評価は数値で入力してください")
      end
      it "練習評価IDが1のときは投稿できない" do
        @record.evaluation_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("練習の評価は1以外の値にしてください")
      end
      
      it "MVPの情報がないと投稿できない" do
        @record.mvp = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("練習のMVPを入力してください")
      end
      it "MVPに選んだ理由がないと投稿できない" do
        @record.mvp_reason = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("MVPに選んだ理由を入力してください")
      end
      it "種目名がないと投稿できない" do
        @record.event = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("スポーツの種目を入力してください")
      end
    end
  end
end
