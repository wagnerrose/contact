class AddSuperadminToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :superadmin, :boolean, :null => false, :default => false

    User.create! do |r|
      r.email      = 'default@example.com'
      r.password   = 'password'
      r.superadmin = true
    end
  end

  def down
    remove_column :users, :superadmin
    User.find_by_email('default@example.com').try(:delete)
  end
end
