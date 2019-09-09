class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 150}
end
