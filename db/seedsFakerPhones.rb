# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'pt-BR'

puts "Cadastrando de Telefones --> Aguarde"
    
1000.times do
    telefone = Phone.create(
        phone_number: Faker::PhoneNumber.cell_phone,
        name_contact: Faker::Name.name,
        company_id: Faker::Number.between(1, 1998)
    )
    puts "Cadastrado telefone: #{telefone.name_contact}, #{telefone.phone_number}, #{telefone.company_id}"
end

puts "Cadastrando de Telefones --> Ok!"
