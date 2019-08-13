FactoryBot.define do
  factory :user do
    name { 'test tarou' }
    email { 'example@softbank.ne.jp' }
    address { '幕張本郷' }
    line_id { 'AABBCCDDEEFF' }
  end
end
