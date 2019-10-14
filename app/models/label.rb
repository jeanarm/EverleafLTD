class Label < ApplicationRecord
  belongs_to :usr
  has_many :labelings
end
