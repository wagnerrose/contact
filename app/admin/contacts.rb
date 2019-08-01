ActiveAdmin.register Contact do
    menu parent: 'contact'
    config.batch_actions = false

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    
    index do
        column :company
        column :analist
        column :date
        column :description
        actions
    end
    filter :date
    filter :company
    filter :analist

    permit_params :date, :description, :company_id, :analist_id

end
