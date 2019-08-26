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

Faker::Config.locale = :ja
I18n.locale = 'ja'

breads = [
  "アレパ", "揚げパン", "あんぱん", "ヴァイツェンブロート", "エッグベネディクト", "エンパナーダ",
  "ガーリックトースト", "カルツォーネ", "カレーパン", "キューヘレ", "クランペット", "クニャペ", "クリームパン", "クリスプ・ブレッド", "グリッシーニ", "クロワッサン", "コーンブレッド", "コッペパン", "米粉パン", "コロッケパン", "コロネ",
  "サンドイッチ", "シナモンロール", "ジャムパン", "シュトレン", "食パン", "スコーン", "スフォリアテッレ", "ソーダブレッド",
  "タコス", "チャパティ", "デニッシュ", "ドーナツ", "トリハス",
  "バターロール", "パニーニ", "ピザトースト", "ハンバーガー", "ピロシキ"
]
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
prices = [128, 256, 512, 1024, 2048, 4096, 8192]
shippings = ['佐川急便', 'クロネコヤマト', 'ゆうパック', '赤帽']

4.upto(100) do |i|
  Product.seed do |s|
    s.id = i
    s.name = breads.sample
    s.number = numbers.sample
    s.price = prices.sample
    s.content = '商品説明を記載する'
    s.preservation = '保存方法を記載する'
    s.how_to_eat = '調理方法を記載する'
    s.expiration = '消費期限を記載する'
    s.shipping = shippings.sample
    s.store_id = numbers.sample
  end
end