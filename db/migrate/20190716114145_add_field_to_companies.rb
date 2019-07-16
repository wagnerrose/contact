class AddFieldToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :regional, foreign_key: true
  end
end
