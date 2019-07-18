ActiveAdmin.register Analist do
    config.sort_order = "name_asc"
    config.batch_actions = false
    menu parent: 'register'
    
    index do
        column :name
        column :email
        column :phone
        column :occupation
        column :job
        column :regional do |reg|
            link_to reg.regional.initials, admin_regional_path(reg.regional)
        end

        actions
    end

    filter :name
    filter :occupation
    filter :job
    filter :regional_id
    
    permit_params :name, :email, :phone, :occupation, :job, :regional_id
end
