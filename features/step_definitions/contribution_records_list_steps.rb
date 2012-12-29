
Given /^the following contribution records exist:$/ do |table|
  #breakpoint
  ContributionRecord.delete_all(1)
  table.hashes.each do |record|
    ContributionRecord.create!(record)
  end
end


Given /^that I have created a contribution record$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a contribution record$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see Candidate "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

