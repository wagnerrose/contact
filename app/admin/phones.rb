ActiveAdmin.register Phone do

    belongs_to :company

    permit_params :name_contact, :email, :company_id, :_destroy
end
