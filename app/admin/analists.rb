ActiveAdmin.register Analist do
includes :regional

    config.sort_order = "name_asc"
    config.batch_actions = false
    menu parent: 'register'
    
 
    action_item :back, only: [:show, :edit] do
        link_to "Voltar", :back
    end

    index do
        column :name do |nome|
            link_to nome.name, admin_analist_path(nome.id), title: "Editar/Apagar"
        end
        column :email
        column :phone
        column :occupation
        column :job 
        column :regional do |reg|
            link_to reg.regional.initials, admin_regional_path(reg.regional)
        end
    end
    form  do |f|
        f.inputs 'Analista' do
            f.input :name, require: true
            f.input :email
            f.input :phone
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
                row :regional
            end
        end
    end
    filter :name
    filter :occupation, as: :select, collection: Analist.occupation.values
    filter :job, as: :select, collection: Analist.job.values
    filter :regional
    
    permit_params :name, :email, :phone, :occupation, :job, :regional_id
end
