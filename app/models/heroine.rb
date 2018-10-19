class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, presence: true
  validates :super_name, presence: true
  # not a deliverable, validating name
  validates :super_name, uniqueness: true
  # Deliverable 7: Make sure not two heroines have the same super name.
end
