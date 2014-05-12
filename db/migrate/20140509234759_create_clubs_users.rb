class CreateClubsUsers < ActiveRecord::Migration
  def change
    create_table :clubs_users do |t|
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end
  end
end
