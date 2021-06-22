class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :favorites
  has_many :requests
  has_many :reviews

  validates :last_name, presence: true
  validates :first_name, presence: true
end
