require 'levenshtein'

class ContributorName < ActiveRecord::Base
  attr_accessible :contributor_type, :first, :last_name, :middle, :suffix, :contributor_id
  validates :contributor_type, :last_name, :presence => true

  has_one :contribution_record
  belongs_to :contributor
  has_and_belongs_to_many :contributor_addresses

  def self.normalize(name)
    if name.nil?
      name
    else
      name.strip.gsub(/  /, " ").tr('",.', '')
    end
  end

  def normalize(name)
    if name.nil?
      name
    else
      name.strip.gsub(/  /, " ").tr('",.', '')
    end
  end

  def self.compare_norm_distance(name1, name2)
     Levenshtein.distance(normalize(name1), normalize(name2))
  end

  def compute_last_name_distance(other_last_name)
     Levenshtein.distance(normalize(last_name), normalize(other_last_name))
  end

  def compute_first_distance(other_first)
     Levenshtein.distance(normalize(first), normalize(other_first))
  end

  def compute_middle_distance(other_middle)
     Levenshtein.distance(normalize(middle), normalize(other_middle))
  end

  def compute_distance(other)
     Levenshtein.distance(normalize(last_name), normalize(other.last_name)) +
      Levenshtein.distance(normalize(first), normalize(other.first)) +
      Levenshtein.distance(normalize(middle), normalize(other.middle))
  end

end
