class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :age
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
