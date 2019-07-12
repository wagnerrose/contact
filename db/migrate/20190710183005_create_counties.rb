class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
