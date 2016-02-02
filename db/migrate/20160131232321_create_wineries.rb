class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
    	t.string :name, 	  default: '', required: true
    	t.string :address,	  default: '', required: true
    	t.string :phone, 	  default: '', required: true
    	t.boolean :wine_club, default: false

    	t.timestamps
    end
  end
end
