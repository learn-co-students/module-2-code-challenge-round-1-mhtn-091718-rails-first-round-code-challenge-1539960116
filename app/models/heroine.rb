class Heroine < ApplicationRecord
  belongs_to :power

  validates :name, :super_name, presence: true
  validates :power_id, numericality: {only_integer: true}
end
