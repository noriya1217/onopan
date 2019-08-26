require 'faker'

Faker::Config.locale = :ja

1.upto(20) do |i|
  ages = [10, 20, 30, 40, 50]
  sexs = ['男', '女']
  professions = ['社会人', '主婦', '学生', 'アルバイト', '無職']

  User.seed do |s|
    s.id = i
    s.name = Faker::Games::Pokemon.name
    s.age = ages.sample
    s.sex = sexs.sample
    s.profession = professions.sample
    s.email = Faker::Internet.email
    s.address = Faker::Address.city
    s.line_id = "U123456789012345"
  end
end