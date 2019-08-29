class DeletePhoneNumberFromPhones < ActiveRecord::Migration[5.2]
  def change
    remove_column :phones, :phone_number, :string
  end
end