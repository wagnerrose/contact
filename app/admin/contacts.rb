ActiveAdmin.register Contact do
    menu parent: 'contact'
    config.batch_actions = false

    permit_params :date, :contact_type, :description, :company_id, :analist_id, :_destroy
    
    filter :date
    filter :company
    filter :analist
    filter :contact_type

    scope "Todos", :all
    scope "Contactar", :nok
    scope "Ok", :ok

    actions :index

    index title: "Face Time" do
        style do
            [".col-date{width: 100px}"].join('')
        end
        column "Face Time" do |facetime|
            facetime.id
        end
        column "Empresa" do |empresa|
            link_to empresa.company.name, admin_company_path(empresa.company.id), title: "Edita ou Apaga Empresa"
        end
        column "Analista" do |analista|
            analista.analist.name
        end
        style do
            [".col-date{width: 100px}"].join('')
        end        
        column :date, as: :datepicker, datepicker_options: {date_Format: 'dd/mm/yy'}
        column "Tipo" do |tipo|
            Contact.translate_human_enum_name(:contact_type, tipo.contact_type)
        end
        column :description
    end
end
 