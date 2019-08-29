ActiveAdmin.register PhoneNumber do
    belongs_to :company

    permit_params :id, :number, :type, :phone_id, :_destroy

end
