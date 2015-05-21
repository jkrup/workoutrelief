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

ActiveRecord::Schema.define(:version => 20130617035059) do

  create_table "body_parts", :force => true do |t|
    t.string   "name"
    t.integer  "x1"
    t.integer  "y1"
    t.integer  "x2"
    t.integer  "y2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "confirmation_codes", :force => true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "confirmation_codes", ["user_id"], :name => "index_confirmation_codes_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "excercises", :force => true do |t|
    t.integer  "bodypart_id"
    t.string   "name"
    t.string   "details"
    t.string   "youtube"
    t.integer  "votes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "excercises", ["bodypart_id"], :name => "index_excercises_on_bodypart_id"

  create_table "excersizes", :force => true do |t|
    t.integer  "bodypart_id"
    t.string   "name"
    t.string   "details"
    t.string   "youtube"
    t.integer  "votes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "excersizes", ["bodypart_id"], :name => "index_excersizes_on_bodypart_id"

  create_table "exercises", :force => true do |t|
    t.integer  "bodypart_id"
    t.string   "name"
    t.text     "details"
    t.string   "youtube"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "exercises", ["bodypart_id"], :name => "index_exercises_on_bodypart_id"

  create_table "identities", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "confirmed"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false, :null => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
