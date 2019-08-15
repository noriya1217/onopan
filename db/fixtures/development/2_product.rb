Product.seed do |s|
  s.id = 1
  s.name = 'ごまパン10個詰め合わせ'
  s.number = 10
  s.price = 1200
  s.content = 'いろんなごまパンが10個も入っている！！！'
  s.preservation = '冷凍保存'
  s.how_to_eat = '自然解凍した後にトースター等で温めてお召し上がり下さい'
  s.expiration = '解凍後当日中。解凍後は出来るだけお早めにお召し上がり下さい'
  s.shipping = '佐川急便'
  s.store_id = 1
end
Product.seed do |s|
  s.id = 2
  s.name = 'トースト24枚セット'
  s.number = 5
  s.price = 840
  s.content = 'めっちゃトースト入っているからめっちゃジャムぬれる'
  s.preservation = '常温保存'
  s.how_to_eat = 'トースター等で温めてお召し上がり下さい'
  s.expiration = '出来るだけお早めにお召し上がり下さい'
  s.shipping = 'クロネコヤマト'
  s.store_id = 2
end
Product.seed do |s|
  s.id = 3
  s.name = 'ハンバーガー'
  s.number = 3
  s.price = 120
  s.content = 'どノーマルハンバーガー'
  s.preservation = '注文後調理します'
  s.how_to_eat = 'はよ食べなはれ'
  s.expiration = 'すぐ食べなはれ'
  s.shipping = 'テイクアウト'
  s.store_id = 3
end
