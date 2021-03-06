class OrderArrivals
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

 with_options presence: true do
  validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "は10桁で入力して下さい。"}
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city
  validates :address
  validates :user_id
  validates :item_id
  validates :token
 end
 validates :phone, length: { maximum: 11 },
                   format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。' }

 def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Arrival.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id )
 end
end