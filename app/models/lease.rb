class Lease < ApplicationRecord
  belongs_to :apartment
  belongs_to :tenant

  validates :apartment, uniqueness: true
end
