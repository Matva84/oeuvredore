class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :initial_start_at, presence: true
  validates :initial_end_at, presence: true
  validates :progress, presence: true
  validates :customer_budget, presence: true
  validates :total_expenses, presence: true

  has_many_attached :photo
end
