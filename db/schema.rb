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

ActiveRecord::Schema.define(version: 20170914131223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "telemovel"
    t.string   "telefone"
    t.string   "email"
    t.integer  "estado"
    t.boolean  "is_active"
    t.integer  "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "logotipo"
    t.index ["cidade_id"], name: "index_empresas_on_cidade_id", using: :btree
  end

  create_table "facturas", force: :cascade do |t|
    t.string   "referencia"
    t.string   "cliente"
    t.string   "contacto"
    t.string   "tipo_de_servico"
    t.string   "responsavel"
    t.integer  "empresa_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_payd",             default: false, null: false
    t.integer  "percentagem_imposto", default: 0,     null: false
    t.decimal  "valor_total",         default: "0.0", null: false
    t.decimal  "desconto",            default: "0.0", null: false
    t.index ["empresa_id"], name: "index_facturas_on_empresa_id", using: :btree
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "telemovel"
    t.string   "tipo_de_ident"
    t.string   "numero_ident"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "empresa_id"
    t.integer  "usuario_id"
    t.index ["empresa_id"], name: "index_funcionarios_on_empresa_id", using: :btree
    t.index ["usuario_id"], name: "index_funcionarios_on_usuario_id", using: :btree
  end

  create_table "item_facturas", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "quantidade"
    t.decimal  "preco_unitario"
    t.string   "descricao"
    t.decimal  "preco_total"
    t.integer  "factura_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["factura_id"], name: "index_item_facturas_on_factura_id", using: :btree
  end

  create_table "registos", force: :cascade do |t|
    t.string   "nome_user"
    t.string   "nome_empresa"
    t.string   "telemovel"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "cidade_id"
    t.integer  "estado",       default: 0, null: false
    t.index ["cidade_id"], name: "index_registos_on_cidade_id", using: :btree
  end

  create_table "tipos_de_descontos", force: :cascade do |t|
    t.string   "nome"
    t.string   "natureza"
    t.string   "motivo"
    t.integer  "percentagem"
    t.boolean  "is_active",   default: false, null: false
    t.boolean  "boolean",     default: false, null: false
    t.integer  "empresa_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["empresa_id"], name: "index_tipos_de_descontos_on_empresa_id", using: :btree
  end

  create_table "tipos_de_impostos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "motivo"
    t.integer  "percentagem"
    t.integer  "empresa_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "is_active",   default: false, null: false
    t.index ["empresa_id"], name: "index_tipos_de_impostos_on_empresa_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "telemovel"
    t.integer  "empresa_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "role"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "senha_provisoria"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["empresa_id"], name: "index_usuarios_on_empresa_id", using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "empresas", "cidades"
  add_foreign_key "facturas", "empresas"
  add_foreign_key "funcionarios", "empresas"
  add_foreign_key "funcionarios", "usuarios"
  add_foreign_key "item_facturas", "facturas"
  add_foreign_key "registos", "cidades"
  add_foreign_key "tipos_de_descontos", "empresas"
  add_foreign_key "tipos_de_impostos", "empresas"
  add_foreign_key "usuarios", "empresas"
end
