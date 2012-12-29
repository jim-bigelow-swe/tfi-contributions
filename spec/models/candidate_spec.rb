require 'spec_helper'
require 'ruby-debug'

describe Candidate do
  it "has a valid factory" do
    @candidate = FactoryGirl.build(:candidate)
    @candidate.should be_valid
  end
  context "Validation" do
    it "is invalid without elected" do
      FactoryGirl.build(:candidate, year: nil).should_not be_valid
    end
    it "is invalid without year" do
      FactoryGirl.build(:candidate, year: nil).should_not be_valid
    end
    it "is invalid without last" do
      FactoryGirl.build(:candidate, last: nil).should_not be_valid
    end
    it "is invalid without first" do
      FactoryGirl.build(:candidate, first: nil).should_not be_valid
    end
    it "is invalid without party" do
      FactoryGirl.build(:candidate, party: nil).should_not be_valid
    end
    it "is invalid without district" do
      FactoryGirl.build(:candidate, district: nil).should_not be_valid
    end
    it "is invalid without office" do
      FactoryGirl.build(:candidate, office: nil).should_not be_valid
    end
  end
  context "Check Associations" do
    it 'should have many contribution records' do
      FactoryGirl.build(:candidate).should have_many(:contribution_records)
    end
    it 'should have one or more contributor_names' do
      FactoryGirl.build(:candidate).should have_many(:contributions)
    end
  end
end
