# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

cidade = Cidade.create(nome: "Luanda", codigo:"LDA")

empresa = Empresa.create(nome: "ZuberCompany", telemovel: "913000000", telefone: "222000000", email: "zuber@email.com", estado: 1, is_active: true, cidade_id: cidade.id, logotipo: nil)
Usuario.create(nome: "JM Cabanga", role: 0 ,telemovel: '913747220', email: 'manuel.cabanga@email.com', password: 'q1w2e3r4t5', password_confirmation: 'q1w2e3r4t5', empresa_id: empresa.id)

empresa_2 = Empresa.create(nome: "D.M Comercial", telemovel: "923254120", telefone: "222000000", email: "dorivaldomiguel25@gmail.com", estado: 1, is_active: true, cidade_id: cidade.id, logotipo: nil)
Usuario.create(nome: "Dorivaldo Miguel", role: 0 ,telemovel: '923254120', email: 'dorivaldomiguel25@gmail.com', password: 'q1w2e3r4t5', password_confirmation: 'q1w2e3r4t5', empresa_id: empresa_2.id)
