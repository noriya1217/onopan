FactoryBot.define do
  factory :relationship do
    user_id { User.first.id }
    store_id { Store.first.id }
  end
end
