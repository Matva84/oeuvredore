class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 6}
  validates :category, presence: true
  validates :progress, presence: true
  validates :budget, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true, comparison: { greater_than: :start_at }

  has_many_attached :photos

end
