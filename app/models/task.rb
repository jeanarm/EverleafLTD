class Task < ApplicationRecord
  belongs_to :usr
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 150}
  paginates_per  3
enum priority: [:low, :medium, :high]


has_many :tasks_labels
 has_many :labels, :through => :tasks_labels
 accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
 accepts_nested_attributes_for :labels


end
