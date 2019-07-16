class AddCityToCAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :county, foreign_key: true
  end
end
