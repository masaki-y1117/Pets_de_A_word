# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Post, "モデルに関するテスト", type: :model do
#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:post)).to be_valid
#     end
#   end
#   context "空白のバリデーションチェック" do
#     it "post_image_idが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       post = Post.new(post_image_id: '')
#       expect(post).to be_invalid
#       expect(post.errors[:post_image_id]).to include("can't be blank")
#     end
#   end
# end
