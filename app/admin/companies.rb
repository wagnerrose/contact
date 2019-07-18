ActiveAdmin.register Company do
    menu parent: 'company'
    config.batch_actions = false
    config.sort_order = "name_asc"

    index do
        column :name
        column :fantasy
        column :code_cnpj
        column :sap
        column :regional do |reg|
            link_to reg.regional.initials, admin_regional_path(reg.regional)
        end


        actions
    end
    filter :regional
    filter :name
    filter :fantasy
    filter :code_cnpj
    filter :sap
    
    permit_params :name, :fantasy, :code_cnpj, :sap, :regional

end
