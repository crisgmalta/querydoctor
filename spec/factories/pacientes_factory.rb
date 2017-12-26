FactoryGirl.define do
  factory :paciente do
    nome { Faker::Name.name }
    data_nascimento { Faker::Date.birthday(18, 65) }
    rg { Faker::Number.number(10) }
    telefone { Faker::PhoneNumber.phone_number }
    convenio
    medicos { create_list(:medico, 2) }
  end
end
