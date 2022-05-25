class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :municipality, :address_number, :building_name, :tel_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address_number
    validates :tel_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }


  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end
end
