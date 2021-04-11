# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "Postモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }
    
    let(:user) { create(:user) }
    let(:comments) { create(:comments) }
    let!(:post) { build(:post, user_id: user.id) }
    
    context 'post_imageカラム' do
      it '空欄でないこと' do
        post.post_image = ''
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end