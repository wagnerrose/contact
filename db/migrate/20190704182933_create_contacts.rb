class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.date :date
      t.text :description
      t.references :company, foreign_key: true
      t.references :analist, foreign_key: true

      t.timestamps
    end
  end
end
