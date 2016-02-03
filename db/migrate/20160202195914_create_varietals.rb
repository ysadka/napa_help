class CreateVarietals < ActiveRecord::Migration
  def change
    create_table :varietals do |t|
    	t.string :name
    	t.string :color
    	t.string :photo_url

    	t.timestamps
    end
  end
end
