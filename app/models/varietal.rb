class Varietal < ActiveRecord::Base

	validates :color, presence: true
	validates :name, presence: true
	validates :photo_url, presence: true
end