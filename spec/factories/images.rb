FactoryBot.define do
  factory :image do
    image     {Rack::Test::UploadedFile.new(File.join(Rails.root, 'test/fixtures/files/sample.jpg')) }
  end
end
