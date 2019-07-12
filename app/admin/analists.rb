ActiveAdmin.register Analist do

    config.sort_order = "name_asc"
    index do
        column :name
        column :email
        column :phone
        column :job
        column :regional
        actions
    end

    filter :name
    filter :email
    filter :job
    filter :regional_id
    
    permit_params :name, :email, :phone, :job, :regional_id
end
