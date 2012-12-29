require 'spec_helper'

describe Contributor do
  it "has a valid factory" do
    record = FactoryGirl.build(:contributor)
    record.should be_valid
  end
  context "Check Associations" do
    it 'should have many contributions' do
      FactoryGirl.build(:contributor).should have_many(:contributions)
    end
    it 'should have many contributor_names' do
      FactoryGirl.build(:contributor).should have_many(:contributor_names)
    end
  end
end
