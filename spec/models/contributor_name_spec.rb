require 'spec_helper'
require 'ruby-debug'

describe ContributorName do
  it "has a valid factory" do
    record = FactoryGirl.build(:contributor_name)
    record.should be_valid
  end
  context "Check Validation" do
    it "is invalid without contributor_type" do
      FactoryGirl.build(:contributor_name, contributor_type: nil).should_not be_valid
    end
    it "is invalid without last_name" do
      FactoryGirl.build(:contributor_name, last_name: nil).should_not be_valid
    end
  end
  context "Check Associations" do
    it 'should have one contribution record' do
      FactoryGirl.build(:contributor_name).should have_one(:contribution_record)
    end
    it 'should belong to a contributor' do
      FactoryGirl.build(:contributor_name).should belong_to(:contributor)
    end
    it 'should have one or more contributor_addresses' do
      FactoryGirl.build(:contributor_name).should have_and_belong_to_many(:contributor_addresses)
    end
  end
  describe "save and query" do
    it 'should be able to create and save a name' do
      debugger
      @dude = ContributorName.create(:last_name => 'Public',
                                     :first => 'John',
                                     :middle => 'Q.',
                                     :contributor_type => 'I')
      @dude.save
    end

    it 'should be able to find a previously created name' do
      debugger
      @john = ContributorName.create(:last_name => 'Public',
                                     :first => 'John',
                                     :middle => 'Q.',
                                     :contributor_type => 'I')
      @john.save
      @names = ContributorName.where(:last_name => 'Public',
                                     :first => 'John',
                                     :middle => 'Q.',
                                     :contributor_type => 'I')
      @names[0].last_name.should == "Public"
    end

  end
  describe "processing the name" do
    it 'should normalize the name by removing punction' do
      ContributorName.normalize("name,").should == "name"
    end
    it 'should normalize the name by removing execess whitespace' do
      ContributorName.normalize("the  name").should == "the name"
    end
    it 'should normalize the name by removing leading and trailing whitespace' do
      ContributorName.normalize(" the  name ").should == "the name"
    end

    context "against other names" do
      before(:each) do
        @name_list = ["AGRI BEEF",
                     "AGRI BEEF ANAGEMENT",
                     "AGRI BEEF CO",
                     "AGRI BEEF MANAGEMENT",
                     "AGRIBEEF MANAGEMENT"]
        @name = Hash[:last_name, "ALLRED", :first,"DAVID", :middle, "F"]
        @record = FactoryGirl.build(:contributor_name, @name)
        @other_name = Hash[:last_name => "ALLRED", :first => "DAVID", :middle => "J"]
        @other_record = FactoryGirl.build(:contributor_name, @other_name)
      end
      it 'should calculate the edit distance of 1 between 2 close names' do
        ContributorName.compare_norm_distance(@name_list[3], @name_list[4]).should == 1
      end
      it 'should calculate a large edit distance between dissimailar names' do
        ContributorName.compare_norm_distance(@name_list[0], @name_list[3]).should > 10
      end
      it 'should calculate an edit distance between this last_name and another last name' do
        distance = @record.compute_last_name_distance(@other_name[:last_name]).should == 0
      end
      it 'should calculate an edit distance between this first and another first name' do
        @record.compute_first_distance(@other_name[:first]).should == 0
      end
      it 'should calculate an edit distance between this middle and another middle name' do
        @record.compute_middle_distance(@other_name[:middle]).should == 1
      end
      it 'should calculate an edit distance between this contributor_name and another one' do
        @record.compute_distance(@other_record).should == 1
      end
    end
  end
end
