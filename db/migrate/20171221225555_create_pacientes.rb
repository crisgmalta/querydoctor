class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :rg
      t.string :telefone
      t.references :convenio, foreign_key: true

      t.timestamps
    end
  end
end
