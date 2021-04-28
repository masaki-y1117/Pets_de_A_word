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

  describe '投稿一覧画面のテスト' do
    before do
      visit posts_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/posts'
      end
    end
    context 'リンクの確認' do
      it '写真検索ボタンを押すと、検索一覧画面に遷移する' do
        click_button '写真検索'
        expect(current_path).to eq '/searches'
      end
    end
  end

  describe '投稿詳細画面のテスト' do
    before do
      visit post_path(post)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/posts/' + post.id.to_s
      end
    end
  end

  describe 'ユーザー情報詳細画面のテスト' do
    before do
      visit user_path(user)
    end

   context '表示内容の確認' do
     it 'URLが正しい' do
       expect(current_path).to eq '/users/' + user.id.to_s
     end
   end
 end

  describe 'ユーザー情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
    end
    context '会員情報変更の確認' do
      it '会員情報を編集してユーザー情報詳細画面に変更した内容が表示される' do
        fill_in 'user_name', with: 'test'
        fill_in 'user_email', with: 'test@test.ne.jp'
        click_button '編集内容を保存'
        expect(current_path).to eq '/users/' + user.id.to_s
        expect(page).to have_content 'test'
      end
    end
  end
end