# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171222003828) do

  create_table "convenios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especialidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.integer "especialidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["especialidade_id"], name: "index_medicos_on_especialidade_id"
  end

  create_table "medicos_pacientes", id: false, force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "medico_id"
    t.index ["medico_id"], name: "index_medicos_pacientes_on_medico_id"
    t.index ["paciente_id"], name: "index_medicos_pacientes_on_paciente_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "rg"
    t.string "telefone"
    t.integer "convenio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convenio_id"], name: "index_pacientes_on_convenio_id"
  end

end
