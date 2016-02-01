class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
    	t.string :name
    	t.boolean :wine_club, default: false

    	t.timestamps
    end
  end
end
