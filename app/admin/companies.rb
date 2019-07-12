ActiveAdmin.register Company do
    index do
        column :name
        column :fantasy
        column :code_cnpj
        column :sap
        actions
    end
    filter :name
    filter :fantasy
    filter :code_cnpj
    filter :sap
    
    permit_params :name, :fantasy, :code_cnpj, :sap

end
