class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :telephone

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gears, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reserved_gears, through: :reservations, source: "gears"
end
