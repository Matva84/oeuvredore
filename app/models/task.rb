class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :progress, presence: true
  validates :budget, presence: true
  validates :dependant_from_task_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  has_many_attached :photos
end
