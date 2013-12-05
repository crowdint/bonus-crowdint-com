class CreateUserBatches < ActiveRecord::Migration
  def change
    create_table :user_batches do |t|
      t.integer :balance
      t.belongs_to :user
      t.belongs_to :batch

      t.timestamps
    end
  end
end
