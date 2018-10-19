class Heroine < ApplicationRecord
  # Each heroine can only have one power.
  belongs_to :power

  validates :name, presence: true
  validates :super_name, presence: true
  validates :name, uniqueness: true

end
