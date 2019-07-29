class AddIndexToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_index :companies, :name
  end
end
