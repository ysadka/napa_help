class CreateAppellations < ActiveRecord::Migration
  def change
    create_table :appellations do |t|
    	t.string :city
    	t.string :state

    	t.timestamps
    end
  end
end
