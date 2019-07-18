class AddInitialsToRegional < ActiveRecord::Migration[5.2]
  def change
    add_column :regionals, :initials, :string
  end
end
