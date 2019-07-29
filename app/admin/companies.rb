ActiveAdmin.register Company do
    menu parent: 'company'
    config.batch_actions = false
    config.sort_order = "name_asc"

    permit_params   :name, 
                    :fantasy, 
                    :code_cnpj, 
                    :sap, 
                    :regional_id,
                    contacts_attributes: [:id, :date, :description]

    index do
        column :name 
        column :fantasy
        column :code_cnpj
        column :sap
        column :regional do |reg|
            link_to reg.regional.initials, admin_regional_path(reg.regional)
        end
        actions 
    end

    form  do |f|
        f.inputs "Empresa" do
            f.input :name
            f.input :fantasy
            f.input :code_cnpj
            f.input :sap
            f.input :regional_id
        end
        f.inputs do
            f.has_many :contacts do |a|
                a.input :date
                a.input :description
            end
        end
        panel 'Markup' do
            "The following can be used in the content below..."
          end
        
        f.actions
    end

    filter :regional
    filter :name
    filter :fantasy
    filter :code_cnpj
    filter :sap
    


end
