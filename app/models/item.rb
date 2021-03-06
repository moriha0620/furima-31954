class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 } 
    validates :product_description, length: { maximum: 1_000 }
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end
  validates :category_id, :product_condition_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 }

end
