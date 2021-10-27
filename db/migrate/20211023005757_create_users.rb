class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.integer :age
      t.string :email
      t.text :about

      t.timestamps
    end
  end
end
