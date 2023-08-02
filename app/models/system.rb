class System < ApplicationRecord
  has_many :part_systems
  has_many :parts, through: :part_systems
end
