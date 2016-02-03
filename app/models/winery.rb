class Winery < ActiveRecord::Base

	validates :address, presence: true
	validates :name,  	presence: true
	validates :phone, 	presence: true
end