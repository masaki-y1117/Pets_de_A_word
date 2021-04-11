FactoryBot.define do
  factory :post do
    post_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end