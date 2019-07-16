class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.string :name_contact
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
