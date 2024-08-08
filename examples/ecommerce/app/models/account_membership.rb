class AccountMembership < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :role
end
