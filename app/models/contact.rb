class Contact < ApplicationRecord

  belongs_to :company
  belongs_to :analist

  scope :nok, -> {where(date: nil)}
  scope :ok, -> {where.not(date: nil)}

  enum contact_type: {
          phone: 0,
          email: 1,
          visit: 2,
          letter: 3,
          app_message: 4,
          sms: 5
  }
  # @return [Array<Array>]
  def self.contact_type_attributes_for_select
    contact_types.map do |contact_type, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.contact_types.#{contact_type}"), contact_type]
    end
  end
end