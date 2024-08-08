class Product < ApplicationRecord
  belongs_to :availability
  belongs_to :supplier
  has_many :product_price_histories
end
