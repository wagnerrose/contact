class DeleteOccupationFromAnalist < ActiveRecord::Migration[5.2]
  def change
    remove_column :analists, :job, :string
    rename_column :analists, :occupation, :string
  end
end