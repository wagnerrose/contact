ActiveAdmin.register State do
    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "code_asc"

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    
    index do
        column :code 
        column :name
        actions 
    end
    filter :code
    filter :name

    permit_params :code, :name
end
