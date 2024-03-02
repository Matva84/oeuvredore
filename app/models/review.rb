class Review < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :rating, presence: true, inclusion: { in: %w(0 1 2 3 4 5) }
  validates :content, length: {minimum: 6}
end
