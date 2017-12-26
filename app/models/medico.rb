class Medico < ApplicationRecord
  belongs_to :especialidade
  has_and_belongs_to_many :pacientes
  validates :nome, presence:true
  validates :especialidade, presence:true

end
