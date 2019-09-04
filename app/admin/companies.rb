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
                    addresses_attributes: [:id, :street, :county_id, :zipcode, :state_id,:company_id, :_destroy],
                    contacts_attribuites: [:id, :date, :description, :company_id, :analist_id, :contact_type, :_destroy],
                    phones_attributes: [:id, :name_contact, :email, :_destroy,
                    phone_numbers_attributes: [:id, :number, :phone_type, :_destroy, :phone_id]],
                    purchases_attributes: [:id, :isp, :service, :band, :value, :comment,
                        :company_id, :status, :renewal_date, :origin, :destiny, :_destroy]
    
    filter :regional
    filter :name
    filter :fantasy

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", admin_companies_path
    end

    index do
        column 'Nome' do |nome|
            strong {link_to nome.name, admin_company_path(nome.id), title: "Edita ou Apaga Empresa."}
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
                    f.has_many :phones, allow_destroy: true, new_record: true  do |p|
                        p.input :name_contact, require: true, input_html: {class: 'maiusculo'}
                        p.input :email, as: :email, input_html: {class: 'minusculo'}
                        p.has_many :phone_numbers, allow_destroy: true, new_record: true do |pn|
                            pn.input :number, input_html: {class: 'telefone'}
                            pn.input :phone_type, as: :select, 
                                    collection: PhoneNumber.phone_type_attributes_for_select, 
                                    input_html: {class: 'select2'}
                        end
                    end
                end
            end
            tab "Face Time" do
                f.inputs 'Face Time' do
                    f.has_many :contacts, allow_destroy: true, new_record: true do |a|                    
                        a.input :company, require: true, input_html: {class: 'maiusculo'}
                        a.input :analist, require: true
                        a.input :date, as: :datepicker, require: true, datepicker_options: {date_Format: 'dd/mm/yy'}
                        a.input :contact_type, as: :select, collection: Contact.contact_type_attributes_for_select, input_html: {class: 'select'}
                        a.input :description, as: :text
                    end
                end 
            end
            tab "Compras" do 
                f.inputs "detalhes" do
                    f.has_many :purchases, allow_destroy: true, new_record: true do |a|
                        a.input :isp, require: true, input_html: {class: 'maiusculo'}
                        a.input :service, require: true, as: :select, collection: Purchase.service_attributes_for_select, input_html: {class: 'select2'}
                        a.input :origin, as: :select, collection: County.all.map {|loc| [loc.name, loc.name]}, input_html: {class: 'select2'} 
                        a.input :destiny, as: :select, collection: County.all.map {|loc| [loc.name, loc.name]}, input_html: {class: 'select2'} 
                        a.input :status, require: true, as: :select, collection: Purchase.status_attributes_for_select, input_html: {class: 'select2'} 
                        a.input :band, require: true
                        a.input :value, require: true
                        a.input :renewal_date, as: :datepicker
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
                column 'Nome' do |nome|
                    strong {link_to nome.name, edit_admin_company_path(nome.id), title: "Edita ou Apaga Empresa."}
                end
                column "Nome Fantasia",:fantasy
                column "CNPJ",:code_cnpj, input_html: {class: 'cnpj'} 
                column "SAP",:sap
                column "Regional" do |regional|
                    regional.regional.name
                end
            end
            table_for company.addresses do
                hr
                column :street
                column "Cidade" do |cidade|
                    cidade.county.name
                end
                column :zipcode, input_html: {class: 'cep'}
                column "Estado" do |estado|
                    estado.state.name
                end
            end
            hr
            table_for company.phones do
                column :name_contact
                column :email
                column "telefone" do |telefone|
                    company.phone_numbers.map(&:number).join("<br />").html_safe
                end
                column "Tipo" do |tipo|
                    company.phone_numbers.map(&:phone_type).join("<br />").html_safe
                end                    
            end
        end
        panel 'Face Time' do
            table_for company.contacts do
                column "Face Time" do |facetime|
                    strong {facetime.id}
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
                column :origin
                column :destiny
                column :band
                column :value do |cur|
                    number_to_currency(cur.value)
                end
                column "Status" do |status|
                    Purchase.translate_human_enum_name(:status, status.status)
                end 
                column :comment
                column (:renewal_date) {|atualizado| CompanyDecorator.new(atualizado).AtualizadoEm}
                column (:updated_at) {|atualizado| CompanyDecorator.new(atualizado).AtualizadoEm}
            end               
        end
    end
end