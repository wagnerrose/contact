ActiveAdmin.register County do

    config.sort_order = "name_asc"
    index do
        column :name
        column :latitude
        column :longitude
        column :state
        column :ibge_meso 
        column :ibge_micro
        column :ibge_county_code
        actions
    end
    filter :name
    filter :state
    filter :ibge_meso
    filter :ibge_micro

    permit_params :name, :latitude, :longitude, :state_id, :ibge_meso, :ibge_micro, :ibge_county_code

end
