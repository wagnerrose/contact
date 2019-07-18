ActiveAdmin.register Phone do
    menu parent: 'company'
    config.batch_actions = false
    config.sort_order = "name_contact_asc"
    
    index do
        column :name_contact
        column :phone_number
        column :company
        actions
    end
    filter :company
    filter :name_contact

permit_params :phone_number, :name_contact, :company

end
