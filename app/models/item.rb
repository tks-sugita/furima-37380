class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_date
  belongs_to :delivery_price
  belongs_to :prefecture
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_date_id, presence: true
  validates :prefecture_id, presence: true
end
