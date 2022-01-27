class Delivery_pice < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

end
