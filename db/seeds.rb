puts "iniciando criacao de dados pelo seed"
[Convenio, Paciente, Especialidade, Medico].each { |klass| klass.destroy_all }

FactoryGirl.create_list(:paciente, 20)
puts "fim da criacao de dados pelo seed"
