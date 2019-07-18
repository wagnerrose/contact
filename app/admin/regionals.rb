ActiveAdmin.register Regional do
    menu parent: 'register'
    config.batch_actions = false
    config.sort_order = "code_asc"
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
