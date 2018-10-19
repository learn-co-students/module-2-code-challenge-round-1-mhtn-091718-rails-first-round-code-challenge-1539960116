class Power < ApplicationRecord
 has_many :heroines
 validates :name, presence: true
end

#A heroine can be created/edited w/ only one of the existing powers
#Achieved with collection_select
