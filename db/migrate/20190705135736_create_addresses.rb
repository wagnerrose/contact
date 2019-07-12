class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.references :state, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
