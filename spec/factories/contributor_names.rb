# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contributor_name do
    contributor_type "C"
    last "AGRA PAC"
    suffix "MyString"
    first "MyString"
    middle "MyString"
  end
end
