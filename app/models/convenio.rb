class Convenio < ApplicationRecord
  has_many :pacientes
  validates :nome, presence:true
end
