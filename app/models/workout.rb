class Workout < ActiveRecord::Base
	extend FriendlyId
	friendly_id :exercise, use: :slugged

	belongs_to :user
	validates :exercise, :weight, :reps, presence: true

	has_many :favorites
	has_many :favorited_by, through: :favorites, source: :user
end
