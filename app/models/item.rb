class Item < ApplicationRecord

  belongs_to :user
  #has_one : buyer

  validates :name,          presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_pice
    belongs_to :prefecture
    belongs_to :shipping_day
    belongs_to :situation
  
end
