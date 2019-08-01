ActiveAdmin.register Regional do
    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "code_asc"

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end


    index do
        column :code
        column :name
        column :initials
        actions
    end
    filter :code
    filter :name
    filter :initials

    permit_params :code, :name, :initials
end
