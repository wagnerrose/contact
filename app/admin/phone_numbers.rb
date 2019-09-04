ActiveAdmin.register PhoneNumber do
    
    belongs_to :company

    permit_params :id, :number, :phone_type, :_destroy, :phone_id 

end
