class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :age
      t.integer :user_id
      t.timestamps
    end
  end
end
