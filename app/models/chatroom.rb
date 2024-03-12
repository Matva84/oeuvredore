class Chatroom < ApplicationRecord
  belongs_to :project
  has_many :messages

  validates :name, presence: true
end
