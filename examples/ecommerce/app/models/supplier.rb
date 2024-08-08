class Supplier < ApplicationRecord
  has_many :products
  has_many :supplier_memberships
  has_many :accounts, through: :supplier_memberships
end
