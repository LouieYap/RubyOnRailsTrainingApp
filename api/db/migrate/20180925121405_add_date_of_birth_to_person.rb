class AddDateOfBirthToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :date_of_birth, :string
  end
end
