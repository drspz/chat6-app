class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :meesages, dependent: :destroy

  validates :name, presence: true
end
