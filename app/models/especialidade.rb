class Especialidade < ApplicationRecord
  has_many :medicos
  validates :nome, presence:true
end
