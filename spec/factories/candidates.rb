# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    elected true
    year "2012-12-19"
    last "Anderson"
    suffix ""
    first "Eric"
    middle ""
    party "REP"
    district "1"
    office "STATE REP., POSITION A"
  end
end
