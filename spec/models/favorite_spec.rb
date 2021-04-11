#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, "Favoriteモデルのテスト", type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Commentモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:comment).macro).to eq :belongs_to
      end
    end
  end
end
