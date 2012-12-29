require 'spec_helper'
require 'ruby-debug'

describe ContributionRecord do
  it "has a valid factory" do
    record = FactoryGirl.build(:contribution_record)
    record.should be_valid
  end
  context "Check Validation" do
    it "is invalid without election_year" do
      FactoryGirl.build(:contribution_record, election_year: nil).should_not be_valid
    end
    it "is invalid without cand_last" do
      FactoryGirl.build(:contribution_record, cand_last: nil).should_not be_valid
    end
    it "is invalid without cand_first" do
      FactoryGirl.build(:contribution_record, cand_first: nil).should_not be_valid
    end
    it "is invalid without party" do
      FactoryGirl.build(:contribution_record, party: nil).should_not be_valid
    end
    it "is invalid without district" do
      FactoryGirl.build(:contribution_record, district: nil).should_not be_valid
    end
    it "is invalid without office" do
      FactoryGirl.build(:contribution_record, office: nil).should_not be_valid
    end
    it "is invalid without contr_date" do
      FactoryGirl.build(:contribution_record, contr_date: nil).should_not be_valid
    end
    it "is invalid without contr_amount" do
      FactoryGirl.build(:contribution_record, contr_amount: nil).should_not be_valid
    end
    it "is invalid without contr_type" do
      FactoryGirl.build(:contribution_record, contr_type: nil).should_not be_valid
    end
    it "is invalid without contr_last" do
      FactoryGirl.build(:contribution_record, contr_last: nil).should_not be_valid
    end
    it "is invalid without contr_mailing" do
      FactoryGirl.build(:contribution_record, contr_mailing: nil).should_not be_valid
    end
    it "is invalid without contr_city" do
      FactoryGirl.build(:contribution_record, contr_city: nil).should_not be_valid
    end
    it "is invalid without contr_st" do
      FactoryGirl.build(:contribution_record, contr_st: nil).should_not be_valid
    end
    it "is invalid without contr_zip" do
      FactoryGirl.build(:contribution_record, contr_zip: nil).should_not be_valid
    end
  end
  context "Check Getters" do
    it "returns the candidate's election year as a string" do
      @contribution = FactoryGirl.build(:contribution_record, election_year: "2012-11-6" )
      @contribution.election_year.to_s.should == "2012-11-06"
    end

    it "returns the candidate's last name as a string" do
      @contribution = FactoryGirl.build(:contribution_record, cand_last: "Man" )
      @contribution.cand_last.should == "Man"
    end

    it "returns the candidate's first name as a string" do
      @contribution = FactoryGirl.build(:contribution_record, cand_first: "Iam" )
      @contribution.cand_first.should == "Iam"
    end

    it "returns the candidate's middle name as a string" do
      @contribution = FactoryGirl.build(:contribution_record, cand_mid: "Da" )
      @contribution.cand_mid.should == "Da"
    end

    it "returns the candidate's suffix as a string" do
      @contribution = FactoryGirl.build(:contribution_record, cand_suf: "Rep" )
      @contribution.cand_suf.should == "Rep"
    end

    it "returns the candidate's party as a string" do
      @contribution = FactoryGirl.build(:contribution_record, party: "DEM" )
      @contribution.party.should == "DEM"
    end

    it "returns the candidate's district as a string" do
      @contribution = FactoryGirl.build(:contribution_record, district: "99" )
      @contribution.district.should == "99"
    end

    it "returns the candidate's office as a string" do
      @contribution = FactoryGirl.build(:contribution_record, office: "Govinator" )
      @contribution.office.should == "Govinator"
    end

    it "returns  :contr_date as a string" do
      FactoryGirl.build(:contribution_record,  contr_date:  "1066-01-01").contr_date.to_s.should == "1066-01-01"
    end

    it "returns  :contr_amount as a string" do
      FactoryGirl.build(:contribution_record,  contr_amount: "100").contr_amount.to_s.should == "100.0"
    end

    it "returns  :contr_type as a string" do
      FactoryGirl.build(:contribution_record,  contr_type: "I").contr_type.to_s.should == "I"
    end

    it "returns  :contr_last as a string" do
      FactoryGirl.build(:contribution_record,  contr_last: "Public").contr_last.to_s.should == "Public"
    end

    it "returns  :contr_suf as a string" do
      FactoryGirl.build(:contribution_record,  contr_suf: "Mr.").contr_suf.to_s.should == "Mr."
    end

    it "returns  :contr_first as a string" do
      FactoryGirl.build(:contribution_record,  contr_first: "John" ).contr_first.to_s.should == "John"
    end

    it "returns  :contr_mid as a string" do
      FactoryGirl.build(:contribution_record,  contr_mid: "Q").contr_mid.to_s.should == "Q"
    end

    it "returns  :contr_mailing as a string" do
      FactoryGirl.build(:contribution_record,  contr_mailing: "100 Main").contr_mailing.to_s.should == "100 Main"
    end

    it "returns  :contr_city as a string" do
      FactoryGirl.build(:contribution_record,  contr_city: "Anywhere").contr_city.to_s.should == "Anywhere"
    end

    it "returns  :contr_st as a string" do
      FactoryGirl.build(:contribution_record,  contr_st: "ID").contr_st.to_s.should == "ID"
    end

    it "returns  :contr_zip as a string" do
      FactoryGirl.build(:contribution_record,  contr_zip: "83704").contr_zip.to_s.should == "83704"
    end


  end
  context "Check Associations" do
    it 'should belong to a candidate' do
      FactoryGirl.build(:contribution_record).should belong_to(:candidate)
    end
    it 'should belong to a contribution' do
      FactoryGirl.build(:contribution_record).should belong_to(:contribution)
    end
    it 'should belong to a contributor_name' do
      FactoryGirl.build(:contribution_record).should belong_to(:contributor_name)
    end
    it 'should belong to a contributor_address' do
      FactoryGirl.build(:contribution_record).should belong_to(:contributor_address)
    end
  end
end
