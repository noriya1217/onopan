FactoryBot.define do
  factory :user do
    name { 'test tarou' }
    age { 25 }
    sex { '男' }
    email { 'example@softbank.ne.jp' }
    address { '幕張本郷' }
    line_id { 'AABBCCDDEEFF' }
  end
end
