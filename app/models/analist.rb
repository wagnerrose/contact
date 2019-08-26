class Analist < ApplicationRecord

  belongs_to :regional
  has_many :contacts

  validates :name, presence: { message: "O nome do analista deve ser informado."}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
        on: :create, message: "O e-mail não é válido" },
        presence: { message: "O E-mail não pode ser em branco."}
  validates :occupation, presence: { message: "O cargo não pode ser em branco." } 
  validates :job, presence: { message: "A atividade deve ser informada."}
  validates :regional_id, presence: { message: "A regional deve ser informada."}

  enum job: {
    commercial: 0, 
    engineering: 1
  }
  enum occupation: {
    account_manager: 0, 
    commercial_engineer: 1
    }

  before_save {
    self.name.upcase!
  }
  # @return [Array<Array>]
  def self.job_attributes_for_select
    jobs.map do |job, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.jobs.#{job}"), job]
    end
  end
  def self.occupation_attributes_for_select 
    occupations.map do |occupation, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.occupations.#{occupation}"), occupation]
    end
  end
end
