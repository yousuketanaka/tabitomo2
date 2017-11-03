class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :reservation_message, presence:true, length:{maximum:500}
end
