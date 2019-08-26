class DeleteStringFromAnalists < ActiveRecord::Migration[5.2]
  def change
    remove_column :analists, :string, :string
  end
end
