class RemoveCityFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :city, :string
  end
end
