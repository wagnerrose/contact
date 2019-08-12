ActiveAdmin.register State do
    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "code_asc"

    permit_params :code, :name

    filter :code
    filter :name

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    
    index do
        column :code do |codigo|
            strong {link_to codigo.code, admin_state_path(codigo.id), title: "Editar/Apagar"}
        end
        column :name
    end
    form do |f|
        f.semantic_errors *f.object.errors.keys 
        f.inputs 'Estado' do
            f.input :code, require: true
            f.input :name, require: true
        end
        f.actions
    end
    show do
        panel 'Estado' do
            attributes_table_for state do
                row :code
                row :name
            end
        end
    end
end