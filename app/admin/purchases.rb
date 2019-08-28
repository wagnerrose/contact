ActiveAdmin.register Purchase do

    belongs_to :company

    permit_params :id, :isp, :service, :band, :value, :comment, :company_id, :created_at, :updated_at

end
