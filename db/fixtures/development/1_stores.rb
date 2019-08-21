require 'fileutils'
Dir.chdir 'public/uploads/'
FileUtils.rm(Dir.glob('*.*'))

Store.seed do |s|
  s.id = 1
  s.email = "test@docomo.ne.jp"
  s.password = 'password'
  s.password_confirmation = 'password'
  s.name = 'テスト壱号店'
  s.address = '渋谷'
  s.telephone = '0120-111-2222'
  s.start_time = Time.zone.local(2019, 8, 10, 9, 0, 0)
  s.end_time = Time.zone.local(2019, 8, 10, 19, 30, 0)
  s.access = '渋谷駅から東へ徒歩72km'
  s.image = Rails.root.join("db/fixtures/images/photo1.jpg").open
end
Store.seed do |s|
  s.id = 2
  s.email = "example@nifty.co.jp"
  s.password = 'password'
  s.password_confirmation = 'password'
  s.name = '進撃のパン屋_mk2'
  s.address = '新宿'
  s.telephone = '03-2222-3333'
  s.start_time = Time.zone.local(2019, 8, 12, 10, 30, 0)
  s.end_time = Time.zone.local(2019, 8, 10, 17, 0, 0)
  s.access = '新宿駅からあっちのほうに4時間ほど歩いた所'
  s.image = Rails.root.join("db/fixtures/images/photo2.jpg").open
end
Store.seed do |s|
  s.id = 3
  s.email = "hogehoge@piyo.com"
  s.password = 'password'
  s.password_confirmation = 'password'
  s.name = '現場猫ぱん'
  s.address = '築地'
  s.telephone = '090-3456-7625'
  s.start_time = Time.zone.local(2019, 8, 14, 12, 20, 0)
  s.end_time = Time.zone.local(2019, 8, 14, 23, 50, 0)
  s.access = '築地駅から徒歩2分'
  s.image = Rails.root.join("db/fixtures/images/photo3.jpg").open
end


Faker::Config.locale = :ja
I18n.locale = 'ja'

4.upto(20) do |i|
  Store.seed do |s|
    s.id = i
    s.email = Faker::Internet.email
    s.password = 'password'
    s.password_confirmation = 'password'
    s.name = Faker::Creature::Animal.name + 'のパン屋'
    s.address = Faker::Address.city
    s.telephone = Faker::PhoneNumber.cell_phone
    s.start_time = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning)
    s.end_time = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :evening)
    s.access = 'お店までの行き方等を記載する'
    s.image = Rails.root.join("db/fixtures/images/photo#{i % 3 + 1}.jpg").open
  end
end