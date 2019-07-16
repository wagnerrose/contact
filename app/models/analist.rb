class Analist < ApplicationRecord
  belongs_to :regional
  has_many :contacts

  validates_presence_of :name, message: "O nome não pode ser em branco."
  validates_presence_of :email, message: "O E-mail não pode ser em branco."
  validates_presence_of :occupation, message: "O cargo não pode ser em branco."  
  validates_presence_of :job, message: "A atividade não pode ser em branco."
  validates_presence_of :regional_id, message: "A regional não pode ser em branco."
end
