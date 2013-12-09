class AddFieldsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :total_allocation, :integer
    add_column :organizations, :min_bonus, :integer
    add_column :organizations, :max_bonus, :integer
    add_column :organizations, :min_assignments, :integer
  end
end
