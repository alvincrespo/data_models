class User < ApplicationRecord
  has_many :account_memberships
  has_many :accounts, through: :account_memberships
  has_many :orders
end
