class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.datetime :expiration_date
      t.float :starting_price
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
