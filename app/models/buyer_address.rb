class BuyerAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :yubin_number, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :yubin_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "10または11桁の半角英数字で入力してください"}
    validates :token
  end
    validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"} 

    def save
      buyer = Buyer.create(user_id: user_id, item_id: item_id)

      Address.create(yubin_number: yubin_number, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, buyer_id: buyer.id, building: building)
    end

end
