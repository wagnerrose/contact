ActiveAdmin.register Analist do

    config.sort_order = "name_asc"
    index do
        column :name
        column :email
        column :phone
        column :occupation
        column :job
        column :regional
        actions
    end

    filter :name
    filter :occupation
    filter :job
    filter :regional_id
    
    permit_params :name, :email, :phone, :occupation, :job, :regional_id
end
