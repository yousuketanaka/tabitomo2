class Listing < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :reservations
	accepts_nested_attributes_for :reservations

	geocoded_by :address
    after_validation :geocode, :if => :address_changed?

	# validates :plan_title, presence: true
	# validates :plan_detail, presence: true
	# validates :cancel_policy, presence: true
	# validates :myprofile, presence: true
	# validates :plan_detail, presence: true
end
