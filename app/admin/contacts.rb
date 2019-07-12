ActiveAdmin.register Contact do
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
