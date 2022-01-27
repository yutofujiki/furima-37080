class Item < ApplicationRecord

  belongs_to :user
  #has_one : buyer

  validates :name,                 presence: true
  validates :price,                presence: true
  validates :explanation,          presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_price_id,    numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id,      numericality: { other_than: 1 , message: "can't be blank"} 
  validates :situation_id,         numericality: { other_than: 1 , message: "can't be blank"} 

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_pice
    belongs_to :prefecture
    belongs_to :shipping_day
    belongs_to :situation
  
end
