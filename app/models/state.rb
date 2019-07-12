class State < ApplicationRecord

    validates :name, presence: { message: "O nome do estado não pode ser em branco."}
    validates :code, presence: { message: "A sigla do estado não pode ser em branco "}, 
            length: { is: 2, message: "deve conter 2 letras."}
end
