ActiveAdmin.register Company do

    includes :regional, :phones, :contacts, :addresses

    menu parent: 'company'
    config.batch_actions = false
    config.sort_order = "name_asc"

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    permit_params   :name, 
                    :fantasy, 
                    :code_cnpj, 
                    :sap, 
                    :regional_id,
                    phones_attributes: [:id, :phone_number, :name_contact, :email, :_destroy],
                    addresses_attributes: [:id, :street, :county_id, :zipcode, :state_id, :company_id, :_destroy],
                    contacts_attribuites: [:id, :date, :description, :company_id, :analist_id, :_destroy]
    
    filter :regional
    filter :name
    filter :fantasy
    filter :code_cnpj
    filter :sap
 
    index do
        column 'Nome' do |nome|
            link_to nome.name, admin_company_path(nome.id), title: "Editar/Apagar"
        end
        column :fantasy
        column :code_cnpj
        column :sap
        column :regional do |reg|
            link_to reg.regional.initials, admin_regional_path(reg.regional), title: "Editar/Apagar"
        end
    end

    form  do |f|
        tabs do
            tab "Empresa" do
                f.inputs "Detalhes" do
                    f.input :name, require: true
                    f.input :fantasy
                    f.input :code_cnpj, input_html: {size: 10}
                    f.input :sap, label: "Código SAP", input_html: {size: 10}
                    f.input :regional
                end
            end
            tab "Endereços" do
                f.inputs "Detalhes" do
                    f.has_many :addresses,
                                new_record: true,
                                allow_destroy: true do |a|
                        a.input :street
                        a.input :county
                        a.input :zipcode
                        a.input :state
                        a.actions
                    end
                end
            end
            tab "Telefones" do 
                f.inputs "detalhes" do
                    f.has_many :phones,
                                allow_destroy: true,
                                new_record: true do |a|
                        a.input :name_contact
                        a.input :phone_number
                        a.input :email
                    end
                end
            end
            tab "Contatos" do 
                f.inputs "detalhes" do
                    f.has_many :contacts,
                                allow_destroy: true,
                                new_record: true do |a|
                        a.input :analist
                        a.input :date
                        a.input :description
                    end
                end
            end
        end
        f.actions
    end
    show do
        panel 'Empresa' do
            attributes_table_for company do
                row :name
                row :fantasy
                row :code_cnpj
                row :sap
                row :regional
            end
        end
        panel 'Endeereço(s)' do
            table_for company.addresses do
                column :street
                column :county
                column :zipcode
                column :state
            end
        end

        panel 'Telefones' do
            table_for company.phones do
                column :name_contact
                column :phone_number
                column :email
            end
        end
        panel 'Contatos' do
            table_for company.contacts do
                column :analist
                column :date
                column :description
            end
        end       
    end
end
