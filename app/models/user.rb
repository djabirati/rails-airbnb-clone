class User < ApplicationRecord
  has_many :meals
  has_many :bookings
  has_many :bookings, through: :meals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end