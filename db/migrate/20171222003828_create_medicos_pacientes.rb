class CreateMedicosPacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :medicos_pacientes, id: false do |t|
      t.belongs_to :paciente, index: true
      t.belongs_to :medico, index: true
    end
  end
end
