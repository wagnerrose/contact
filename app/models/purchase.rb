class Purchase < ApplicationRecord
  belongs_to :company

  validates :isp, presence: { message: "O nome do ISP deve ser informado."}
  validates :service, presence: { message: "O tipo do serviço deve ser informado."}
  validates :band, presence: { message: "A banda comprada deve ser informada."},
            numericality: {message: "Deve ser informado um valor númerico no campo Banda Contratada."}
  validates :value, presence: { message: "O valor pago por Mbps deve ser informado."},
            numericality: {message: "Deve ser informado um valor numérico no campo Valor Pago."}
  validates :company_id, presence: { message: "A empresa deve ser informada."}

  enum service: {
    p2_ptt: 0,
    p2p: 1,
    ip_pnbl: 2,
    ip: 3,
    ip_telebras: 4,
    sat: 5,
    telebras_sat: 6
  }

  enum status: {
    activated: 0,
    proposal: 1
  }


  before_save {
    self.isp.upcase!
}


  # @return [Array<Array>]
  def self.service_attributes_for_select
    services.map do |service, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.services.#{service}"), service]
    end
  end
  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
    end
  end

end
