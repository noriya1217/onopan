1.upto(100) do |i|
  ProductImage.seed do |s|
    s.id = i
    s.product_id = i
    s.image = Rails.root.join("db/fixtures/images/bread#{i % 3 + 1}.jpg").open
  end
end