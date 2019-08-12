ActiveAdmin.register Regional do
    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "code_asc"

    permit_params :code, :name, :initials

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end


    index do
        column :code do |codigo|
            strong {link_to codigo.code, admin_regional_path(codigo.id), title: "Editar/Apagar"}
        end
        column :name
        column :initials
    end
    form do |f|
        f.semantic_errors *f.object.errors.keys 
        f.inputs 'Regional' do
            f.input :code, require: true
            f.input :name, require: true
            f.input :initials, require: true
        end
        f.actions
    end
    show do
        panel 'Regional' do
            attributes_table_for regional do
                row :code
                row :name
                row :initials
            end
        end
    end
end




