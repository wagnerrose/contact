ActiveAdmin.register Analist do
includes :regional

    config.sort_order = "name_asc"
    config.batch_actions = false
    menu parent: 'register'

    permit_params :name, :email, :phone, :occupation, :job, :regional_id

    filter :name
    filter :occupation, as: :select, collection: Analist.occupation.values
    filter :job, as: :select, collection: Analist.job.values
    filter :regional
 
    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    index do
        column :name do |nome|
            strong {link_to nome.name, admin_analist_path(nome.id), title: "Editar/Apagar"}
        end
        column :email
        column :phone
        column :occupation
        column :job 
        column :regional do |regional|
            regional.regional.initials
        end
    end
    form  do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs 'Analista' do
            f.input :name, require: true, input_html: {class: 'maiusculo'}
            f.input :email, input_html: {class: 'minusculo'}
            f.input :phone, as: :phone
            f.input :occupation
            f.input :job
            f.input :regional, require: true
        end
        f.actions
    end
    show do
        panel 'Analista' do
            attributes_table_for analist do
                row :name
                row :phone
                row :occupation
                row :job
                row "Regional" do |regional|
                    regional.regional.initials
                end
            end
        end
    end
end
