class Candidate < ActiveRecord::Base
  attr_accessible :district, :elected, :first, :last, :middle, :office, :party, :suffix, :year
  validates :district, :first, :last, :office, :party, :year, :presence => true
  validates :elected, :inclusion => { :in => [true, false] }, :presence => true

  has_many :contribution_records
  has_many :contributions

end
