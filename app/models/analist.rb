class Analist < ApplicationRecord
    extend Enumerize
    extend ActiveModel::Naming
    

  belongs_to :regional
  has_many :contacts

  validates :name, presence: { message: "O nome do analista deve ser informado."}

  validates :email, 
        email: {message: "Favor verificar o email, pois seu formato esta incorreto."},
        presence: { message: "O E-mail não pode ser em branco."}
  validates :occupation, presence: { message: "O cargo não pode ser em branco." } 
  validates :job, presence: { message: "A atividade deve ser informada."}
  validates :regional_id, presence: { message: "A regional deve ser informada."}

  enumerize :job, in: [:Comercial, :Engenheiro]
  enumerize :occupation, in: [:Ger_Contas, :Eng_Comercial]

  before_save {
    self.name.upcase!
  }

end
