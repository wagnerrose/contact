# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando de Telefones."
telefones = [
    ['55 3798-1277', 'Cassiano Zanon', 132],
    ['51 99297-5383', 'Laércio Kleber', 631],
    ['51 9297-8882', 'Luisa', 631],
    ['51 3697-6300', 'Laércio Kleber', 631],
    ['55 99908-9766', 'Marco Tulio - Dir. Com', 544],
    ['55 3411-8348', 'Marco Tulio - Dir. Com', 544],
    ['51 99952-4184', 'José Felipe Gorniski - Diretor Executivo', 567],
    ['51 3734-1223', 'José Felipe Gorniski - Diretor Executivo', 567],
    ['53 98403-1314', 'Fabiano Borges Souza-Dir.Com', 561],
    ['53 3262-3030', 'Fabiano Borges Souza-Dir.Com', 561],
    ['54 3324-5800', 'Rodrigo Machado', 122],
    ['55 99642-7733', 'Alceone Silva', 513],
    ['53 98402.8947', 'Marcos Batista Brum de Brum-Diretor', 452],
    ['53 3026-7329', 'Marcos Batista Brum de Brum-Diretor', 452],
    ['53 3243-7600', 'Marcos Batista Brum de Brum-Diretor', 452],
    ['55 99108-0200 ', 'Alisson Giuliani', 1659],
    ['55 3233-1796', 'PLUGNET', 1659],
    ['55 9986-3660 ', 'PLUGNET', 1659],
    ['54 3279-3700', 'Saulo Fonseca', 387],
    ['54 98135-1602 ', 'Leo', 387],
    ['54 99651-2885', 'Saulo Fonseca', 387],
    ['51 99840-9033', 'Guilherme Freitas de Castro-Diretor Operacional ', 7],
    ['55 99670-5908', 'Samuel Lautert Jardim', 495],
    ['55 3276-2068', 'Samuel Lautert Jardim', 495],
    ['55 3252-1631', 'Marcelo Panassol ', 405],
    ['55 99634-1479', 'Marcelo Panassol ', 405],
    ['55 3252-1064', 'NETSKY', 405],
    ['51 3376-9500', 'Diéferson Camargo-Engenheiro&Operações', 473],
    ['51 99119-4022', 'Diéferson Camargo-Engenheiro&Operações', 473],
    ['51 99673-5131', 'Diéferson Camargo-Engenheiro&Operações', 473],
    ['55 3542-1440', 'Juliano Foletto', 324],
    ['55 99921-6110', 'Jarbas andre Rodrigues', 212],
    ['55 3433-5053', 'Jarbas andre Rodrigues', 212],
    ['55 99648-8068', 'Luiz Bastian Júnior', 546],
    ['51 98158-9910', 'Giovani Cusinato', 196],
    ['51 3321-2186 ', 'Giovani Cusinato', 196],
    ['55 98407-0909', 'Sérgio Renato Silveira de Oliveira', 1983],
    ['55 3242-5119', 'Sérgio Renato Silveira de Oliveira', 1983],
    ['54 99151-1666', 'Alexandre Silva', 204],
    ['51 3484-6568', 'Adair Luis Souza de Souza', 52],
    ['54 99673-5838', 'Eduardo Fiando Capitanio', 323],
    ['54 3055-4921', 'Eduardo Fiando Capitanio', 323],
    ['51 98428-0000', ' Adriel Gonçalves', 517],
    ['51 98473-0000', 'SINALNET - REDE DE COMUNICAÇÕES', 517],
    ['51 3032-8402', 'Multitel Comunicações Ltda', 383],
    ['54 3317-8100', 'RAZÃOINFO INTERNET LTDA', 463],
    ['54 3045-2095', 'GINET INFORMÁTICA', 223],
    ['54 3028-0048', 'GIGAWIRE Internet via Rádio', 221],
    ['51 981855775 ', 'L & C TELECOM', 306],
    ['51 40638103', 'L & C TELECOM', 306],
    ['51 99180-0920 ', 'Lindomar Giovani Couto de Avila', 416],
    ['55 997100512 ', 'Flávio', 466],
    ['55 34224480', 'CONESUL', 466],
    ['55 32315646', 'Daniel', 15],
    ['53 32612613', 'Paulo', 442],
    ['53 984021022', 'Paulo', 442],
    ['53 984286582', 'Paulo', 442],
    ['55 991084543', 'Zilio', 469],
    ['55 35118000', 'Jorge', 469],
    ['55 91636303 ', 'Jorge', 469],
    ['54 91212828', 'Luciano Vargas dos Santos', 310],
    ['51 32877922', 'Leandro', 268],
    ['51 985491235', 'Leandro', 268],
    ['54 981315255', 'Itacir', 151],
    ['53 99795416', 'Henrique Honório Cabral', 241],
    ['55 984023237', 'Erivelton', 97],
    ['54 32099000', 'Névio', 57]   
]       

telefones.each do |telefone, nome, empresa|

    Phone.create!(phone_number: telefone, name_contact: nome, company_id: empresa)

    puts "Criando Telefones: #{empresa}, #{nome}, #{telefone}"
  end

  puts "Telefones adicionados ....."