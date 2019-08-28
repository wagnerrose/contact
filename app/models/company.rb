class Company < ApplicationRecord
    belongs_to :regional
    has_many :contacts, dependent: :destroy
    has_many :phones, dependent: :destroy
    has_many :addresses, dependent: :destroy
    has_many :purchases, dependent: :destroy

    accepts_nested_attributes_for :contacts, allow_destroy: true
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :addresses, allow_destroy: true
    accepts_nested_attributes_for :purchases, allow_destroy: true

    validates :name, presence: { message: "O nome da empresa deve ser informada."}
    validates :regional_id, presence: { message: "O nome da regional deve ser preenchido."}
    validates :code_cnpj, cpf_or_cnpj: {message: "CPF/CNPJ com valor incorreto.", allow_blank: true}

    before_save {
        self.name.upcase!
        self.fantasy.upcase!
    }



end
