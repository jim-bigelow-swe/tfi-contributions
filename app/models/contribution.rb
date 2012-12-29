class Contribution < ActiveRecord::Base
  attr_accessible :amount, :date, :candidate_id, :contributor_id
  validates :date, :presence => true
  validates :amount, :numericality => { :only_interger => true }, :presence => true

  has_one :contribution_record
  belongs_to :contributor
  belongs_to :candidate
end
