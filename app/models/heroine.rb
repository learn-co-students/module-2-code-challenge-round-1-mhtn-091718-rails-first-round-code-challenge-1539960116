class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, presence: true, uniqueness: true# presence: true
  #validates :token, presence: true, uniqueness: true, strict:
  validates :super_name, presence: true
  validates :power, presence: true
end
