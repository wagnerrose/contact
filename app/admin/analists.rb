ActiveAdmin.register Analist do
includes :regional

    config.sort_order = "name_asc"
    config.batch_actions = false
    menu parent: 'register'

    permit_params :name, :email, :phone, :occupation, :job, :regional_id

    filter :name
    filter :regional
 
    action_item :back, only: [:show, :edit] do
        link_to "Voltar", admin_analists_path
    end

    index do
        column :name do |nome|
            strong {link_to nome.name, admin_analist_path(nome.id), title: "Editar/Apagar"}
        end
        column :email
        column :phone, input_html: {class: 'sp_celphones'}
        column "Cargo" do |cargo|
            Analist.translate_human_enum_name(:occupation, cargo.occupation)
        end
        column "Atividade" do |atividade|
            Analist.translate_human_enum_name(:job, atividade.job)
        end
        column :regional do |regional|
            regional.regional.initials
        end
    end
    form  do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs 'Analista' do
            f.input :name, require: true, input_html: {class: 'maiusculo'}
            f.input :email, input_html: {class: 'minusculo'}
            f.input :phone, input_html: {class: 'sp_celphones'}
            f.input :occupation, as: :select, collection: Analist.occupation_attributes_for_select, input_html: {class: 'select'}
            f.input :job, as: :select, collection: Analist.job_attributes_for_select, input_html: {class: 'select'}
            f.input :regional, require: true
        end
        f.actions
    end
    show do
        panel 'Analista' do
            attributes_table_for analist do
                row :name
                row :email
                row :phone, input_html: {class: 'sp_celphones'}
                row "Cargo" do |cargo|
                    Analist.translate_human_enum_name(:occupation, cargo.occupation)
                end
                row "Atividade" do |atividade|
                    Analist.translate_human_enum_name(:job, atividade.job)
                end
                row "Regional" do |regional|
                    regional.regional.initials
                end
            end
        end
    end
end
