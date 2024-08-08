class SupplierMembership < ApplicationRecord
  belongs_to :supplier
  belongs_to :account # NOTE: this should probably be user
  belongs_to :role
end
