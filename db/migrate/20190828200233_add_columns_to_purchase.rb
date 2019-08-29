class AddColumnsToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :renewal_date, :date
    add_column :purchases, :origin, :string
    add_column :purchases, :destiny, :string
  end
end
