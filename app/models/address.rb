class Address < ApplicationRecord
  belongs_to :state
  belongs_to :company
  belongs_to :county

    validates :street, presence: { message: "O logradoro deve ser informado."}
    validates :state_id, presence: { message: "O estado deve ser informado."}
    validates :county_id, presence: { message: "A cidade deve ser informada."}

    before_save {
      self.street.upcase!
    }

end
