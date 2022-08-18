class Product < ApplicationRecord
  PRODUCT_ATTRS = [:name, :description, :price, :quantity, :category_id,
                   :image].freeze
  belongs_to :category
  mount_uploader :image, ImageUploader
  validates :name, presence: true,
            length: {minium: Settings.product.name_min_length,
                     maximum: Settings.product.name_max_length}

  validates :description, presence: true

  validates :price, presence: true,
            format: {with: Settings.product.price_format},
            numericality: {greater_than: Settings.product.num_min}

  validates :quantity, presence: true,
            format: {with: Settings.product.price_format},
            numericality: {greater_than: Settings.product.num_min,
                           less_than: Settings.product.num_max}
  scope :filter_by_starts_with, ->(name){where("name like ?", "#{name}%")}
  scope :filter_by_price_lower, ->(price_lower){where "price >= ?", price_lower}
  scope :filter_by_price_higher, ->(price_higher){where "price <= ?", price_higher}
  scope :newest, ->{order(created_at: :desc)}
end
