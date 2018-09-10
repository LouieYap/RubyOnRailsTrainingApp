class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.text :firstname
      t.text :lastname
      t.text :middlename
      t.integer :age
      t.text :username

      t.timestamps
    end
  end
end
