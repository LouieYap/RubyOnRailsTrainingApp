class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :age
      t.string :integer
      t.string :username

      t.timestamps
    end
  end
end
