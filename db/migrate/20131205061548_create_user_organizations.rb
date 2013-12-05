class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|
      t.belongs_to :user
      t.belongs_to :organization
      t.string :role

      t.timestamps
    end
  end
end
