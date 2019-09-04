class Phone < ApplicationRecord
  belongs_to :company
  has_many :phone_numbers, dependent: :destroy
  
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  validates :name_contact, presence: { message: "O nome de contato deve ser informado."}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
            on: :create, message: "O e-mail não é válido" }
    
 
  before_save {
    self.name_contact.upcase!
    self.email.downcase!
  }
end
