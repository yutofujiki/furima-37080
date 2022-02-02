FactoryBot.define do
  factory :item do
    name                    {'アイテム名'}
    price                   {'10000'}
    explanation             {'説明'}
    category_id             {'3'}
    situation_id            {'2'}
    delivery_price_id       {'2'}
    prefecture_id           {'3'}
    shipping_day_id         {'2'}
    association :user 
  end
end
