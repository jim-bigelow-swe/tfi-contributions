require 'spec_helper'

describe ContributorAddress do
  it "has a valid factory" do
    FactoryGirl.build(:contributor_address).should be_valid
  end
  context "Check Validation" do
    it "is invalid without mailing" do
      FactoryGirl.build(:contributor_address, mailing: nil).should_not be_valid
    end
    it "is invalid without city" do
      FactoryGirl.build(:contributor_address, city: nil).should_not be_valid
    end
    it "is invalid without state" do
      FactoryGirl.build(:contributor_address, state: nil).should_not be_valid
    end
    it "is invalid without zip" do
      FactoryGirl.build(:contributor_address, zip: nil).should_not be_valid
    end
  end
  context "Check Associations" do
    it 'should have one contribution record' do
      FactoryGirl.build(:contributor_address).should have_one(:contribution_record)
    end
    it 'should have one or more contributor_names' do
      FactoryGirl.build(:contributor_address).should have_and_belong_to_many(:contributor_names)
    end
  end

  describe "Using SmartyStreet API" do
    it 'should get an API Key'
    it 'should call API with street information' do
      address = Hash.new(:mailing => '1 infinite loop', :city => "cupertino", :state => "ca", :zip => "95014")
      ContributorAddress.should_receive(:verify_street).with(hash_including address)
      ContributorAddress.verify_with_smartystreets(address)
    end
    it 'should parse street information returned from the API'

  end
end
