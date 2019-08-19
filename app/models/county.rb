class County < ApplicationRecord
  belongs_to :state

  validates :name, presence: { message: "O nome da localidade deve ser informad."}  
  validates :latitude, numericality: true
  validates :longitude, numericality: true
  validates :state_id, presence: { message: "O estado deve ser informado."}  

  before_save {
    self.name.upcase!
  }

end
