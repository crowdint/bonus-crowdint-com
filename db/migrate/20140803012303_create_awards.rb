class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :event_id
      t.integer :points
      t.text :comment

      t.timestamps
    end
  end
end
