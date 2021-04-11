# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, "Commentモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let!(:user) { build(:user) }
    let!(:post) { build(:post, {user: user})}
    let!(:comment) { build(:comment, :user => user, :post => post) }

    context 'commentカラム' do
      it '空欄でないこと' do
        comment.comment = ''
        is_expected.to eq false
      end
      it '50文字以下であること: 50文字は○' do
        comment.comment = Faker::Lorem.characters(number: 49)
        is_expected.to eq true
      end
      it '50文字以下であること: 51文字は×' do
        comment.comment = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end