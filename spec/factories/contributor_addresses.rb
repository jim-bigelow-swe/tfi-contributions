# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contributor_address do
    mailing "PO BOX 4848"
    city "POCATELLO"
    state "ID"
    zip "83205"
  end
end
