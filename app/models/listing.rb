class Listing < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy

	# validates :plan_title, presence: true
	# validates :plan_detail, presence: true
	# validates :cancel_policy, presence: true
	# validates :myprofile, presence: true
	# validates :plan_detail, presence: true
end
