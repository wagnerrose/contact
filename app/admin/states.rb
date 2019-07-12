ActiveAdmin.register State do
    config.sort_order = "code_asc"
    index do
        column :code 
        column :name
        actions 
    end
    filter :code
    filter :name

    permit_params :code, :name
end
