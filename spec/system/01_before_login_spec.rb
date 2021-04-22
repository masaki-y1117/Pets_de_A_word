# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  before do
    visit root_path
  end
  
  describe 'ヘッダーのテスト：ログインしていない場合' do
    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Pets_de_A_wordを押すと、トップ画面に遷移する' do
        click_link 'Pets_de_A_word'
        expect(current_path).to eq '/'
      end
      it 'サイトについてを押すと、アバウト画面に遷移する' do
        click_link 'サイトについて'
        expect(current_path).to eq '/about'
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        click_link '投稿一覧'
        expect(current_path).to eq '/posts'
      end
      # it '新規登録を押すと、新規登録画面に遷移する' do
      #   click_link '新規登録'
      #   expect(current_path).to eq '/users/sign_up'
      # end
      # it 'ログインを押すと、ログイン画面に遷移する' do
      #   click_link 'ログイン'
      #   expect(current_path).to eq '/users/rog'
      # end
    end
  end
  
  describe 'ユーザー新規登録のテスト' do
    before do
      visit new_user_registration_path
    end
    
    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password]', with: 'password'
      end
      
      # it '正しく新規登録される' do
      #   expect { click_button '新規登録' }.to change(User.all, :count).by(1)
      # end
      # it '新規登録後のリダイレクト先が、新規登録出来たユーザーの詳細画面になっている' do
      #   click_button '新規登録'
      #   expect(current_path).to eq '/users' + User.last.id.to_s
      # end
    end
  end
  
  describe 'ユーザーログインのテスト' do
    let(:user) { create(:user) }
    
    before do
      visit new_user_session_path
    end
    
    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end
      
      it 'ログイン後のリダイレクト先が、ログインしたユーザーの詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
    
    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end
      
      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end
  
  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }
    
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    
    # context 'ヘッダーの表示を確認' do
    #   it 'タイトルが表示される' do
    #     expect(page).to have_content 'Pets_de_A_word'
    #   end
    # end
  end
end