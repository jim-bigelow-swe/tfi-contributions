require 'spec_helper'

describe "ContributorAddresses" do
  describe "GET /contributor_addresses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get contributor_addresses_path
      response.status.should be(200)
    end
  end
end