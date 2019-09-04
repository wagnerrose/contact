# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'pt-BR'

puts "Cadastrando Telefones --> Aguarde"
telefones = Phone.ids

500.times do
    telefone_id = telefones.sample
    telefone = PhoneNumber.create(
        number: Faker::PhoneNumber.phone_number,
        phone_id: telefone_id
    )
    puts "Cadastrado telefone: #{telefone.number}, #{telefone.phone_id}"
    telefone = PhoneNumber.create(
        number: Faker::PhoneNumber.cell_phone,
        phone_id: telefone_id
    )
    puts "Cadastrado Celular: #{telefone.number}, #{telefone.phone_id}"
end

puts "Cadastrados Telefones --> Ok!"
