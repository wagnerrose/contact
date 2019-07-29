class AddEmailToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :email, :string
  end
end
