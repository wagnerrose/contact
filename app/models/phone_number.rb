class PhoneNumber < ApplicationRecord
  belongs_to :phone

  validates :number, presence: { message: "O número do telefone deve ser informado."}

  enum type: {
    mobile: 0,
    home: 1,
    work: 2,
    fax: 3 }

  def self.type_attributes_for_select
    types.map do |tipo, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.types.#{tipo}"), tipo]
    end
  end
end
