class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
    	t.string  :name, 	  required: true, default: ""
        t.string  :address,   required: true, default: ""
        t.string  :city,      required: true, default: ""
    	t.string  :state,	  required: true, default: ""
    	t.string  :phone, 	  required: true, default: ""
    	t.string  :website,   required: true, default: ""
    	t.boolean :wine_club,                 default: false

    	t.timestamps
    end
  end
end
