class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :pro, presence: true

  has_one_attached :photo
end
