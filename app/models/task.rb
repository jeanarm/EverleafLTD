class Task < ApplicationRecord
  belongs_to :usr
  has_many :labelings
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 150}
  paginates_per  3
enum priority: [:low, :medium, :high]

end
