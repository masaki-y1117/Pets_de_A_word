# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) {create(:post, user: other_user) }
  
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  
  describe 'ヘッダーのテスト:　ログインしている場合' do
    context 'リンク内容を確認' do
      subject { current_path }
      
      it 'マイページを押すと、自分のユーザー詳細画面に遷移する' do
        user_link = find_all('a')[1].native.inner_text
        click_link user_link
        is_expected.to eq '/users/' + user.id.to_s
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        post_link = find_all('a')[2].native.inner_text
        click_link post_link
        is_expected.to eq '/posts'
      end
      it 'ログアウトを押すと、トップ画面に遷移する' do
        out_link = find_all('a')[3].native.inner_text
        click_link out_link
        is_expected.to eq '/'
      end
    end
  end
end