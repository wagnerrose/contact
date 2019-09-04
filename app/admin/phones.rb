ActiveAdmin.register Phone do

    belongs_to :company

    permit_params :id, :name_contact, :email, :company_id, :_destroy,
        phone_numbers_attributes: [:id, :number, :phone_type, :_destroy, :phone_id]
    
    
end
