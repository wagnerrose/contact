class Phone < ApplicationRecord
  belongs_to :company

    validates :phone_number, presence: { message: "O número do telefone deve ser informado."}
    validates :name_contact, presence: { message: "O nome de contato deve ser informado."}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
              on: :create, message: "O e-mail não é válido" }
    
  before_save {
    self.name_contact.upcase!
    self.email.downcase!
  }
end
