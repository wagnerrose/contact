class Contact < ApplicationRecord
  belongs_to :company
  belongs_to :analist

  scope :nok, -> {where(date: nil)}
  scope :ok, -> {where.not(date: nil)}

end
