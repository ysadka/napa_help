class Winery < ActiveRecord::Base
	
	validates :name, presence: true
end