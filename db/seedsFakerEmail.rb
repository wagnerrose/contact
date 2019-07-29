# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'pt-BR'

puts "Cadastrando E-mails --> Aguarde"
telefones = Phone.ids    
1500.times do
    id = telefones.sample
    telefone = Phone.find(id)
    telefone.email = Faker::Internet.email(telefone.name_contact)
    telefone.save
    puts "Cadastrado telefone: #{telefone.name_contact}, #{telefone.email}"
end

puts "Cadastrando E-mails --> Ok!"
