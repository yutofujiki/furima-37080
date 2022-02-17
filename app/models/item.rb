class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_many_attached :images

  validates :name,                 presence: true
  validates :price,                presence: true , inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :explanation,          presence: true
  validates :images,                presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank" } 
  validates :delivery_price_id,    numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_day_id,      numericality: { other_than: 1 , message: "can't be blank" } 
  validates :situation_id,         numericality: { other_than: 1 , message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_price
    belongs_to :prefecture
    belongs_to :shipping_day
    belongs_to :situation
  
end
