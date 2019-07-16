class AddFieldsToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :ibge_meso, :string
    add_column :counties, :ibge_micro, :string
    add_column :counties, :ibge_county_code, :integer
  end
end
