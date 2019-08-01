class Company < ApplicationRecord
    has_many :contacts
    belongs_to :regional
    has_many :phones
    has_many :addresses
    
    accepts_nested_attributes_for :contacts, :allow_destroy => true
    accepts_nested_attributes_for :phones, :allow_destroy => true
    accepts_nested_attributes_for :addresses, :allow_destroy => true

end
