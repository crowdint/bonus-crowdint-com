class CreateBonuses < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.string :message
      t.integer :amount
      t.integer :sender_id
      t.integer :receiver_id
      t.belongs_to :batch
      t.timestamps
    end
  end
end
