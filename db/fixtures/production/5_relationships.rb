numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

1.upto(100) do |i|
  Relationship.seed do |s|
    s.id = i
    s.user_id = numbers.sample
    s.store_id = numbers.sample
  end
end

1.upto(20) do |i|
  Relationship.seed do |s|
    s.id = i + 100
    s.user_id = i
    s.store_id = 1
  end
end