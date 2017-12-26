# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Convenio.create(nome: 'unimed')
#Convenio.create(nome: 'bradesco')

#Paciente.create(nome: 'Cristiane', data_nascimento: '18/09/1980', rg:'3434343', telefone: '123456', convenio_id: 1)
#Paciente.create(nome: 'Lucas', data_nascimento: '11/09/1980', rg:'5555', telefone: '5555', convenio_id: 1)
#Paciente.create(nome: 'Gabriele', data_nascimento: '08/09/1980', rg:'44444', telefone: '4444', convenio_id: 2)

#Especialidade.create(nome: 'Cirurgiao')
#Especialidade.create(nome: 'Gastro')
#Especialidade.create(nome: 'Clinico')
#Especialidade.create(nome: 'Ginecologista')
#Especialidade.create(nome: 'Pediatria')

#Medico.create(nome: 'Gideao', especialidade_id: 4)
#Medico.create(nome: 'Miguel', especialidade_id: 3)
#Medico.create(nome: 'Andre', especialidade_id: 2)
#Medico.create(nome: 'Kenedy', especialidade_id: 1)
[Convenio, Paciente, Especialidade, Medico].each { |klass| klass.destroy_all }

FactoryGirl.create_list(:paciente, 20)