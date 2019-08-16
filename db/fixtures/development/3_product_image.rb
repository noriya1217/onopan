ProductImage.seed do |s|
  s.id = 1
  s.product_id = 1
  s.image = Rails.root.join("db/fixtures/images/bread1.jpg").open
end
ProductImage.seed do |s|
  s.id = 2
  s.product_id = 2
  s.image = Rails.root.join("db/fixtures/images/bread2.jpg").open
end
ProductImage.seed do |s|
  s.id = 3
  s.product_id = 3
  s.image = Rails.root.join("db/fixtures/images/bread3.jpg").open
end