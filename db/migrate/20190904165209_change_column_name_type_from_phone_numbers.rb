class ChangeColumnNameTypeFromPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    rename_column :phone_numbers, :type, :phone_type
  end
end
