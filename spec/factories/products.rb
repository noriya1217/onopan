FactoryBot.define do
  factory :product do
    name { 'ロスパン10個詰め合わせ' }
    number { 3 }
    price { 1500 }
    content { 'フランスパンや菓子パンはいってます' }
    preservation { '冷凍保存' }
    how_to_eat { '冷凍されたパンは自然解凍してからトースター等で温めてお召し上がり下さい' }
    expiration { '冷凍状態で1ヶ月は大丈夫です。解凍後はなるべくお早めにお召し上がり下さい' }
    shipping { '配達は佐川急便になります' }
    remarks { '備考。記載しなくてもOK' }
    store_id { Store.first.id }
  end
end
