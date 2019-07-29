ActiveAdmin.register Phone do
    menu parent: 'company'
    config.batch_actions = false
    index do
        column :company
        column :name_contact
        column :phone_number
        column :email
        actions
    end
    filter :company
    filter :name_contact

    permit_params :phone_number, :name_contact, :email, :company_id
end
