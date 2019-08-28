ActiveAdmin.register Company do

    includes :regional, :phones, :contacts, :addresses

    menu parent: 'company'
    config.batch_actions = false
    config.sort_order = "name_asc"
    permit_params   :name, 
                    :fantasy, 
                    :code_cnpj, 
                    :sap, 
                    :regional_id,
                    addresses_attributes: [:id, :street, :county_id, :zipcode, :state_id, 
                        :company_id, :_destroy],
                    contacts_attribuites: [:id, :date, :description, :company_id, :analist_id, 
                        :contact_type, :_destroy],
                    phones_attributes: [:id, :phone_number, :name_contact, :email, :_destroy],
                    purchases_attributes: [:id, :isp, :service, :band, :value, :comment,
                        :company_id, :created_at, :updated_at, :_destroy]
    
    filter :regional
    filter :name
    filter :fantasy

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", admin_companies_path
    end

    index do
        column 'Nome' do |nome|
            strong {link_to nome.name, admin_company_path(nome.id), title: "Editar/Apagar"}
        end
        column :fantasy
        column :code_cnpj, input_html: {class: 'cnpj'} 
        column :sap
        column :regional do |reg|
            reg.regional.initials
        end
    end

    form  do |f|
        f.semantic_errors *f.object.errors.keys        
        tabs do
            tab "Empresa" do
                f.inputs "Detalhes" do
                    f.input :name, require: true, input_html: {class: 'maiusculo'}
                    f.input :fantasy, input_html: {class: 'maiusculo'}
                    f.input :code_cnpj, input_html: {class: 'cnpj'} 
                    f.input :sap, label: "Código SAP", input_html: {size: 10}
                    f.input :regional
                end
            end
            tab "Endereços" do
                f.inputs "Detalhes" do
                    f.has_many :addresses,
                                new_record: true,
                                allow_destroy: true do |a|
                        a.input :street, input_html: {class: 'maiusculo'}
                        a.input :county, require: true
                        a.input :state, require: true
                        a.input :zipcode, input_html: {class: 'cep'}
                        a.actions
                    end
                end
            end
            tab "Telefones" do 
                f.inputs "detalhes" do
                    f.has_many :phones,
                                allow_destroy: true,
                                new_record: true do |a|
                        a.input :name_contact, require: true, input_html: {class: 'maiusculo'}
                        a.input :phone_number, require: true, wrapper_html: {class: 'telefone'} 
                        a.input :email, as: :email, input_html: {class: 'minusculo'}
                    end
                end
            end
            tab "Compras" do 
                f.inputs "detalhes" do
                    f.has_many :purchases,
                                allow_destroy: true,
                                new_record: true do |a|
                        a.input :isp, require: true, input_html: {class: 'maiusculo'}
                        a.input :service, require: true, as: :select, collection: Purchase.service_attributes_for_select, input_html: {class: 'select'}
                        a.input :band, require: true
                        a.input :value, require: true
                        a.input :comment, as: :text
                    end
                end
            end            
        end
        f.actions
    end
    show do
        panel 'Empresa' do
            table_for company do
                column :name
                column :fantasy
                column :code_cnpj, input_html: {class: 'cnpj'} 
                column :sap
                column "Regional" do |regional|
                    regional.regional.name
                end
            end
        end
        panel 'Endereço(s)' do
            table_for company.addresses do
                column :street
                column "Cidade" do |cidade|
                    cidade.county.name
                end
                column :zipcode, input_html: {class: 'cep'}
                column "Estado" do |estado|
                    estado.state.name
                end
            end
        end

        panel 'Telefone(s)' do
            table_for company.phones do
                column :name_contact
                column :phone_number, input_html: {class: 'telefone'} 
                column :email
            end
        end
        panel 'Face Time' do
            table_for company.contacts do
                column "Face Time" do |facetime|
                    strong {link_to facetime.id, admin_contact_path(facetime.id), title: "Edita/Apaga Face Time"}
                end
                column "Analista" do |analista|
                    analista.analist.name
                end
                column :date, as: :datepicker
                column :description
            end
        end
        panel 'Compras' do
            table_for company.purchases do
                column :isp do |provedor|
                    strong{provedor.isp}
                end
                column "Serviço" do |tipo|
                    Purchase.translate_human_enum_name(:service, tipo.service)
                end
                column :band
                column :value do |cur|
                    number_to_currency(cur.value)
                end 
                column :comment
                column (:created_at) {|criado| CompanyDecorator.new(criado).CriadoEm} 
                column (:updated_at) {|atualizado| CompanyDecorator.new(atualizado).AtualizadoEm}
            end               
        end
    end
end
