class Winery < ActiveRecord::Base

	has_and_belongs_to_many :varietals

	validates :address,  presence: true
	validates :city, 		 presence: true
	validates :name, 		 presence: true
	validates :phone,  	 presence: true
	validates :state, 	 presence: true
	validates :website,  presence: true
end