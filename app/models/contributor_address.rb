class ContributorAddress < ActiveRecord::Base
  attr_accessible :city, :mailing, :state, :zip
  validates :city, :mailing, :state, :zip, :presence => true

  has_one :contribution_record
  has_and_belongs_to_many :contributor_names


  class ContributorAddress::InvalidKeyError < StandardError ; end

  def verify_address(contr_mailing, contr_city, contr_st, contr_zip)
    #stub out for now
    address=Hash.new
    address[:mailing] = contr_mailing
    address[:city] = contr_city
    address[:state] = contr_st
    address[:zip] = contr_zip
  end

  def verify_with_smartystreets
    begin
      verify_street address
    rescue ArgumentError => smarty_street_error
      raise ContributorAddress::InvalidKeyError smarty_street_error.message
    end
  end


end
