class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :isp
      t.integer :service
      t.float :band
      t.float :value
      t.text :comment
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
