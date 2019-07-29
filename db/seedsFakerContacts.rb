# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'pt-BR'

puts "Cadastrando contatos --> Aguarde"
empresas = Company.ids
analistas = Analist.ids

500.times do
    descricao = Faker::Lorem.paragraph
    descricao.gsub!(/["]/,'')
    contato = Contact.create(
        date: Faker::Date.between(1.year.ago, Date.today),
        description: descricao,
        company_id: empresas.sample,
        analist_id: analistas.sample
    )
    puts "Cadastrado contato: #{contato.date}, #{contato.company_id}, #{contato.analist_id}"
end

puts "Cadastrado contatos --> Ok!"
