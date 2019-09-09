ActiveAdmin.register User do
  config.batch_actions = false
  config.sort_order = "email_asc"

  permit_params :email, :password, :password_confirmation, :superadmin

  filter :email
  filter :superadmin

  action_item :back, only: [:show, :edit] do
    link_to "Voltar", admin_users_path
  end

  index do
    column :email do |dado|
        strong {link_to dado.email, admin_user_path(dado.id), title: "Editar/Apagar"}
    end
    column (:created_at) {|atualizado| DateDecorator.new(atualizado).AtualizadoEm}
    column (:updated_at) {|atualizado| DateDecorator.new(atualizado).AtualizadoEm} 
    column :superadmin
  end

    form do |f|
      f.inputs "Detalhes" do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :superadmin
      end
      f.actions
    end

    show do
      panel 'Usuários' do
          attributes_table_for user do
              row :email
              row (:created_at) {|atualizado| DateDecorator.new(atualizado).AtualizadoEm}
              row (:updated_at) {|atualizado| DateDecorator.new(atualizado).AtualizadoEm} 
              row :superadmin
          end
      end
    end
 
    create_or_edit = Proc.new {
      @user            = User.find_or_create_by_id(params[:id])
      @user.superadmin = params[:user][:superadmin]
      @user.attributes = params[:user].delete_if do |k, v|
        (k == "superadmin") ||
        (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
      end
      if @user.save
        redirect_to :action => :show, :id => @user.id
      else
        render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
      end
    }
    #member_action :create, :method => :post, &create_or_edit
    #member_action :update, :method => :put, &create_or_edit
  
  end