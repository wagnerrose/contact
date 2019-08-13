ActiveAdmin.register County do

    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "name_asc"

    permit_params :name, :latitude, :longitude, :state_id, :ibge_meso, :ibge_micro, :ibge_county_code

    filter :name
    filter :state
    filter :ibge_meso
    filter :ibge_micro
    
    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end
    
    index do
        column 'Nome' do |nome|
            strong {link_to nome.name, admin_county_path(nome.id), title: "Editar/Apagar"}
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
    form do |f|
        f.semantic_errors *f.object.errors.keys 
        f.inputs 'Localidade' do
            f.input :name, require: true
            f.input :latitude
            f.input :longitude
            f.input :state
            f.input :ibge_meso
            f.input :ibge_micro
            f.input :ibge_county_code            
        end
        f.actions
    end
    show do
        panel 'Localidade' do
            attributes_table_for county do
                row :name
                row :latitude
                row :longitude
                row "Estado" do |estado|
                    estado.state.code
                end
                row :ibge_meso
                row :ibge_micro
                row :ibge_county_code
            end
        end
    end
end

