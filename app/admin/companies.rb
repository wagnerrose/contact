ActiveAdmin.register Company do
    config.sort_order = "name_asc"
    index do
        column :name
        column :fantasy
        column :code_cnpj
        column :sap
        column :regional
        actions
    end
    filter :regional
    filter :name
    filter :fantasy
    filter :code_cnpj
    filter :sap
    
    permit_params :name, :fantasy, :code_cnpj, :sap, :regional

end
