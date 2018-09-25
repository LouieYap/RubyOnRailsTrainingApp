class AddColumnsToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :country_id, :integer
    add_column :people, :state_id, :integer
  end
end
