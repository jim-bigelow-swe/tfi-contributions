# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contribution_record do
    election_year "2011-11-17"
    cand_last "Anderson"
    cand_suf "MyString"
    cand_first "Eric"
    cand_mid "MyString"
    party "REP"
    district "1"
    office "STATE REP., POSITION A"
    contr_date "2010-9-17"
    contr_amount "250.00"
    contr_type "C"
    contr_last "AGRA PAC"
    contr_suf "MyString"
    contr_first "MyString"
    contr_mid "MyString"
    contr_mailing "PO BOX 4848"
    contr_city "POCATELLO"
    contr_st "ID"
    contr_zip "83205"
  end
end
