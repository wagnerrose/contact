class Regional < ApplicationRecord
    has_many :companies
    has_many :analists

    validates :code, presence: {message: "O Codigo deve ser preenchida."}
    validates :name, presence: {message: "O nome da regional deve ser preenchida."}
    validates :initials, presence: {message: "A sigla da regional deve ser preenchida."}

    before_save {
        self.name.upcase!
        self.initials.upcase!
    }

end
