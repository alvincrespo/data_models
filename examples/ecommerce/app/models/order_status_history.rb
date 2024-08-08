class OrderStatusHistory < ApplicationRecord
  belongs_to :order
  belongs_to :order_status
end
