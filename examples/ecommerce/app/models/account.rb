class Account < ApplicationRecord
  has_many :account_memberships
  has_many :users, through: :account_memberships
  has_many :supplier_memberships
  has_many :suppliers, through: :supplier_memberships
end
