# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171228142454) do

  create_table "ciclovidas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "item_id"
    t.string   "localizacao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "tipo_cerveja"
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome_cervejaria"
    t.string   "CNPJ"
    t.string   "estoque_mp"
    t.string   "estoque_final"
    t.string   "ciclo_vida_barril"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "estoquefinals", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "cliente_id"
    t.integer  "quantidade_atual"
    t.string   "destino"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "atualizar"
    t.integer  "tempo_maximo_guardado"
    t.integer  "quantidade_entrada"
    t.integer  "quantidade_saida"
    t.string   "lote"
  end

  create_table "estoquemps", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "item"
    t.integer  "quantidade_atual"
    t.string   "fornecedor"
    t.string   "atualizar"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.string   "barcode"
    t.integer  "cliente_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "tamanho_barril"
  end

  create_table "materiaprimas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "item"
    t.string   "unidades"
    t.integer  "tamanho_pacote"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "total_pagar"
    t.string   "pagamento_realizado"
    t.datetime "data_proximo_pagamento"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "receita", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "nome_receita"
    t.string   "itens_receita"
    t.string   "quantidade_usada"
    t.string   "unidade_receita"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "nivel_usuario"
    t.integer  "cliente_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
