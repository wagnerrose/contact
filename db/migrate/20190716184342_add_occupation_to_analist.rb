class AddOccupationToAnalist < ActiveRecord::Migration[5.2]
  def change
    add_column :analists, :occupation, :string
  end
end
