ActiveAdmin.register Address do
    index do
        column :company
        column :street
        column :county
        column :state
        column :zipcode
        actions
    end
    filter :company
    filter :county
    filter :state
    
    permit_params :street, :county_id, :zipcode, :state_id, :company_id
end
