class CreateVarietalsWineries < ActiveRecord::Migration
	def change
		create_table :varietals_wineries do |t|
			t.belongs_to :varietal, index: true
			t.belongs_to :winery, 	index: true
		end
	end
end
