class Regional < ApplicationRecord
    has_many :companies
    has_many :analists
end
