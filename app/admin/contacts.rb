ActiveAdmin.register Contact do
    menu parent: 'contact'
    config.batch_actions = false


    permit_params :id,:date, :description, :company_id, :analist_id, :_destroy

    index title: "Face Time" do
        column "Face Time" do |facetime|
            strong {link_to facetime.id, admin_contact_path(facetime.id), title: "Editar/Apagar"}
        end
        column :company
        column :analist
        column :date, as: :datepicker, datepicker_options: {date_Format: 'dd/mm/yy'}
        column :description
    end
    filter :date
    filter :company
    filter :analist

    form  title: "Face Time" do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs 'Face Time' do
            f.input :company, require: true, input_html: {size: 10}
            f.input :analist, require: true
            f.input :date, require:true,  as: :date_picker
            f.input :description 
        end 
        f.actions 
    end
    show title: "Face Time" do
        columns do 
            column max_width: "800px", min_width: "500px" do 
                panel "" do 
                    attributes_table_for contact do 
                        row :company 
                        row :analist 
                        row :date, as: :datepicker, datepicker_options: {date_Format: 'dd/mm/yy'}
                        row :description
                    end 
                end 
            end 
        end 
    end
end
