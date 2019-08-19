class Company < ApplicationRecord
    belongs_to :regional
    has_many :contacts, dependent: :destroy
    has_many :phones, dependent: :destroy
    has_many :addresses, dependent: :destroy

    accepts_nested_attributes_for :contacts, allow_destroy: true
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :addresses, allow_destroy: true

    validates :name, presence: { message: "O nome da empresa deve ser informada."}
    validates :regional_id, presence: { message: "O nome da regional deve ser preenchido."}

    before_save {
        self.name.upcase!
        self.fantasy.upcase!
    }



end
