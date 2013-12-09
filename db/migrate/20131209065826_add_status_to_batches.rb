class AddStatusToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :status, :integer
  end
end
