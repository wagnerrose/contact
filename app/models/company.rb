class Company < ApplicationRecord
    has_many :contacts
    belongs_to :regional
    has_many :phones
end
