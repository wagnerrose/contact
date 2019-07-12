ActiveAdmin.register County do

    config.sort_order = "name_asc"
    index do
        column :name
        column :latitude
        column :longitude
        column :state
        actions
    end
    filter :name
    filter :state

    permit_params :name, :latitude, :longitude, :state

end
