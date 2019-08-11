FactoryBot.define do
  factory :store do
    email { 'test@nifty.com' }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'onopan' }
    address { '渋谷区' }
    telephone { '090-1234-5678' }
    start_time { Time.now }
    end_time { Time.now }
    access { '渋谷駅から歩いて18時間' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/profile_image.jpg'), 'image/jpeg') }
  end
end
