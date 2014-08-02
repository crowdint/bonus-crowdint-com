class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :opens_at
      t.datetime :closes_at

      t.timestamps
    end
  end
end
