ActiveAdmin.register County do

    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "name_asc"

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end
    
    index do
        column 'Nome' do |nome|
            link_to nome.name, admin_county_path(nome.id), title: "Editar/Apagar"
        end
        column :latitude
        column :longitude
        column  :state do |sigla|
            sigla.state.code
        end
        column :ibge_meso 
        column :ibge_micro
        column :ibge_county_code
    end
    filter :name
    filter :state
    filter :ibge_meso
    filter :ibge_micro

    permit_params :name, :latitude, :longitude, :state_id, :ibge_meso, :ibge_micro, :ibge_county_code

end
