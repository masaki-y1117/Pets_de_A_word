# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  before do
    visit root_path
  end

  describe 'ヘッダーのテスト：ログインしていない場合' do
    context 'リンクの内容を確認' do

      it 'Pet_de_A_wordを押すと、トップ画面に遷移する' do
        click_link 'Pets_de_A_word'
        expect(current_path).to eq '/'
      end
    end
  end

end