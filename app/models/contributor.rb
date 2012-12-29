class Contributor < ActiveRecord::Base

  has_many :contributions
  has_many :contributor_names
end
