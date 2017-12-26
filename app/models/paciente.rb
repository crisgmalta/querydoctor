class Paciente < ApplicationRecord
  belongs_to :convenio
  has_and_belongs_to_many :medicos
  validates :nome, presence:true
end

