class ApplicationController < ActionController::Base
    protect_from_forgery

    def authenticate_active_admin_user!
      authenticate_user!
      unless current_user.superadmin?
        flash[:alert] = "Unauthorized Access!"
        redirect_to root_path
      end
    end
    # usado para autorizacao cancancna
    def access_denied(exception)
      redirect_to admin_organizations_path, alert: exception.message
    end
end
