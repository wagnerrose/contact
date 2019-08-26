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

    action_item :back, only: [:show, :edit] do
        link_to "Voltar", admin_contacts_path
    end
    
    index title: "Face Time" do
        column "Face Time" do |facetime|
            strong {link_to facetime.id, admin_contact_path(facetime.id), title: "Editar/Apagar"}
        end
        column "Empresa" do |empresa|
            empresa.company.name
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
    form  title: "Face Time" do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs 'Face Time' do
            f.input :company, require: true, input_html: {class: 'maiusculo'}
            f.input :analist, require: true
            f.input :date, require:true,  as: :date_picker
            f.input :contact_type, as: :select, collection: Contact.contact_type_attributes_for_select, input_html: {class: 'select'}
            f.input :description, as: :text
        end 
        f.actions 
    end
    show title: "Face Time" do
        columns do 
            column max_width: "800px", min_width: "500px" do 
                panel "" do 
                    attributes_table_for contact do 
                        row :company 
                        row "Analista" do |analista| 
                            analista.analist.name
                        end 
                        row :date, as: :datepicker, datepicker_options: {date_Format: 'dd/mm/yy'}
                        tag_row "Tipo contato" do |tipo|
                            Contact.translate_human_enum_name(:contact_type, tipo.contact_type)
                        end
                        row :description
                    end 
                end 
            end 
        end 
    end
end
 