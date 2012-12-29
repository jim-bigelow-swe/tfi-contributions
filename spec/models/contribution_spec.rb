require 'spec_helper'

describe Contribution do
  it "has a valid factory" do
    record = FactoryGirl.build(:contribution)
    record.should be_valid
  end
  context "Check Validation" do
    it "is invalid without date" do
      FactoryGirl.build(:contribution, date: nil).should_not be_valid
    end
    it "is invalid without amount" do
      FactoryGirl.build(:contribution, amount: nil).should_not be_valid
    end
  end
  context "Check Associations" do
    it 'should have one contribution_record' do
      FactoryGirl.build(:contribution).should have_one(:contribution_record)
    end
    it 'should belong to a contributor' do
      FactoryGirl.build(:contribution).should belong_to(:contributor)
    end
    it 'should belong to a candidate' do
      FactoryGirl.build(:contribution).should belong_to(:candidate)
    end
  end
end
