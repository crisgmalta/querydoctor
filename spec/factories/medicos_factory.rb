FactoryGirl.define do
  factory :medico do
    nome { Faker::Name.name }
    especialidade
  end
end
