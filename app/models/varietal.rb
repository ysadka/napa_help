class Varietal < ActiveRecord::Base

	has_and_belongs_to_many :wineries

	validates :color, presence: true
	validates :name, presence: true
	validates :photo_url, presence: true
end