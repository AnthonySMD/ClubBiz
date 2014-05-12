class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :max_attendees
      t.string :location
      t.text :description
      t.integer :club_id

      t.timestamps
    end
  end
end
