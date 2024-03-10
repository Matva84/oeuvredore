class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :initial_start_at, presence: true
  validates :initial_end_at, presence: true, comparison: { greater_than: :initial_start_at }
  validates :progress, presence: true
  validates :customer_budget, presence: true
  validates :total_expenses, presence: true
  # validates :customer

  has_many_attached :photo
end
