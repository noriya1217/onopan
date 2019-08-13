FactoryBot.define do
  factory :number_purchase do
    user_id { User.first.id }
    product_id { Product.first.id }
    number { 1 }
  end
end
