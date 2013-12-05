class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.integer :allocation
      t.belongs_to :organization
      t.timestamps
    end
  end
end
