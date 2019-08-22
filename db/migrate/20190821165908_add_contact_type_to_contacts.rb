class AddContactTypeToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :contact_type, :integer
  end
end
