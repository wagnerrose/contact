class AddJobToAnalists < ActiveRecord::Migration[5.2]
  def change
    add_column :analists, :job, :integer
    add_column :analists, :occupation, :integer
  end
end
