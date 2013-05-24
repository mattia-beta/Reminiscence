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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130515191927) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.string   "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.date     "date"
    t.string   "kind"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "senior_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "memories", :force => true do |t|
    t.string   "titolo"
    t.string   "testo"
    t.datetime "data"
    t.boolean  "privato"
    t.string   "luogo"
    t.integer  "senior_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "seniors", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "birthday"
    t.string   "city"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "things", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.string   "kind"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mail"
    t.string   "lang"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "id_facebook"
  end

end
