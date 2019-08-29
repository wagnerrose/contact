ActiveAdmin.register Contact do
    menu parent: 'contact'
    config.batch_actions = false

    permit_params :id,:date, :contact_type, :description, :company_id, :analist_id, :_destroy
    
    filter :date
    filter :company
    filter :analist
    filter :contact_type

    scope "Todos", :all
    scope "Contactar", :nok
    scope "Ok", :ok

    actions :index

    index title: "Face Time" do
        column "Face Time" do |facetime|
            strong {facetime.id}
        end
        column "Empresa" do |empresa|
            strong{link_to empresa.company.name, edit_admin_company_path(empresa.company.id), title: "Edita ou Apaga Empresa"}
        end
        column "Analista" do |analista|
            analista.analist.name
        end
        column :date, as: :datepicker, datepicker_options: {date_Format: 'dd/mm/yy'}
        column "Tipo" do |tipo|
            Contact.translate_human_enum_name(:contact_type, tipo.contact_type)
        end
        column :description
    end
end
 