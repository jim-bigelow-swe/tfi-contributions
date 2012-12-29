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

ActiveRecord::Schema.define(:version => 20121229174038) do

  create_table "candidates", :force => true do |t|
    t.boolean  "elected",    :default => false
    t.date     "year"
    t.string   "last"
    t.string   "suffix"
    t.string   "first"
    t.string   "middle"
    t.string   "party"
    t.string   "district"
    t.string   "office"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "contribution_records", :force => true do |t|
    t.date     "election_year"
    t.string   "cand_last"
    t.string   "cand_suf"
    t.string   "cand_first"
    t.string   "cand_mid"
    t.string   "party"
    t.string   "district"
    t.string   "office"
    t.date     "contr_date"
    t.decimal  "contr_amount"
    t.string   "contr_type"
    t.string   "contr_last"
    t.string   "contr_suf"
    t.string   "contr_first"
    t.string   "contr_mid"
    t.string   "contr_mailing"
    t.string   "contr_city"
    t.string   "contr_st"
    t.string   "contr_zip"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "candidate_id"
    t.integer  "contribution_id"
    t.integer  "contributor_name_id"
    t.integer  "contributor_address_id"
  end

  add_index "contribution_records", ["candidate_id"], :name => "index_contribution_records_on_candidate_id"
  add_index "contribution_records", ["contribution_id"], :name => "index_contribution_records_on_contribution_id"
  add_index "contribution_records", ["contributor_address_id"], :name => "index_contribution_records_on_contributor_address_id"
  add_index "contribution_records", ["contributor_name_id"], :name => "index_contribution_records_on_contributor_name_id"

  create_table "contributions", :force => true do |t|
    t.date     "date"
    t.integer  "amount"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "contribution_record_id"
    t.integer  "candidate_id"
    t.integer  "contributor_id"
  end

  add_index "contributions", ["candidate_id"], :name => "index_contributions_on_candidate_id"
  add_index "contributions", ["contribution_record_id"], :name => "index_contributions_on_contribution_record_id"
  add_index "contributions", ["contributor_id"], :name => "index_contributions_on_contributor_id"

  create_table "contributor_addresses", :force => true do |t|
    t.string   "mailing"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "contribution_record_id"
  end

  add_index "contributor_addresses", ["contribution_record_id"], :name => "index_contributor_addresses_on_contribution_record_id"

  create_table "contributor_addresses_contributor_names", :id => false, :force => true do |t|
    t.integer "contributor_address_id"
    t.integer "contributor_name_id"
  end

  add_index "contributor_addresses_contributor_names", ["contributor_address_id"], :name => "address_index"
  add_index "contributor_addresses_contributor_names", ["contributor_name_id"], :name => "name_index"

  create_table "contributor_names", :force => true do |t|
    t.string   "last_name"
    t.string   "suffix"
    t.string   "first"
    t.string   "middle"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "contributor_type"
    t.integer  "contribution_record_id"
    t.integer  "contributor_id"
  end

  add_index "contributor_names", ["contribution_record_id"], :name => "index_contributor_names_on_contribution_record_id"
  add_index "contributor_names", ["contributor_id"], :name => "index_contributor_names_on_contributor_id"

  create_table "contributors", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
