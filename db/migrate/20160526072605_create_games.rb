class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :user1
      t.string :user2
      t.string :video

      t.timestamps null: false
    end
  end
end
