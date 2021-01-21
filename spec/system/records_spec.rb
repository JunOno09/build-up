require 'rails_helper'

def visit_with_http_auth(path)
  admin = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{admin}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "記録投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.build(:record)
  end

  context '記録投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
       # トップページに移動する
       visit_with_http_auth root_path
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('新規投稿')
      # 投稿ページに移動する
      visit new_record_path
      # フォームに情報を入力する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('record[image]', image_path, make_visible: true)
      fill_in 'record[tr_theme]', with: @record.tr_theme
      fill_in 'record[tr_content]', with: @record.tr_content
      select '1990', from: 'record_tr_day_1i'
      select '1', from: 'record_tr_day_2i'
      select '19', from: 'record_tr_day_3i'
      fill_in 'record[event]' ,with: @record.event
      select '未就学児', from: 'item-sales-status'
      select '大変満足', from: 'item-shipping-fee-status'
      fill_in 'record[mvp]' ,with: @record.mvp
      fill_in 'record[mvp_reason]' , with: @record.mvp_reason
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Record.count}.by(1)
      # トップページに遷移する
      visit root_path
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit_with_http_auth root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end
