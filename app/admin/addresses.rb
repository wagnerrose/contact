ActiveAdmin.register Address do
    index do
        column :company
        column :street
        column :city
        column :state
        column :zipcode
        actions
    end
    filter :city
    filter :state
    filter :company
    
    permit_params :street, :city, :zipcode, :state_id, :company_id
end
