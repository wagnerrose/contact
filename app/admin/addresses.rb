ActiveAdmin.register Address do
 
    belongs_to :company
    
    permit_params :street, :county_id, :zipcode, :state_id, :company_id, :_destroy
end
