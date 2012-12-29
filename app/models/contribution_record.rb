class ContributionRecord < ActiveRecord::Base
  attr_accessible :cand_first, :cand_last, :cand_mid, :cand_suf, :contr_amount, :contr_city, :contr_date, :contr_first, :contr_last, :contr_mailing, :contr_mid, :contr_st, :contr_suf, :contr_type, :contr_zip, :district, :election_year, :office, :party

  validates :election_year, :presence => true
  validates :cand_last, :cand_first,:party, :district, :office, :presence => true
  validates :contr_date,:contr_amount, :presence => true
  validates :contr_last, :contr_type, :presence => true
  validates :contr_mailing, :contr_city, :contr_st, :contr_zip, :presence => true

  belongs_to :candidate
  belongs_to :contribution
  belongs_to :contributor_name
  belongs_to :contributor_address


  before_save :create_associated_models

  protected

  def get_or_make_contributor
    @contributors = Contributor.joins(:contributor_names).where(:contributor_names =>  {
                                                                 :last_name => contr_last,
                                                                 :suffix => contr_suf,
                                                                 :first => contr_first,
                                                                 :middle => contr_mid} )
    if @contributors.nil? || @contributors.empty?
      # no exact match, is there a fuzzy match?
      fuzzy_pattern = "#{contr_last[0]}%"
      @contributors = Contributor.joins(:contributor_names).where("contributor_names.last_name LIKE ?", fuzzy_pattern)
      if @contributors.nil? || @contributors.empty?
        # create new
        @contributor = Contributor.create
      else
        # check how similar this contributor is to the contributors in the list
        @contributor = nil
        @contributors.each do |existing_contrib|

          existing_names = ContributorName.where("contributor_id = ?",existing_contrib.id)

          if !existing_names.nil?
            existing_names.each do |existing_name|
              #check last name, than first, than middle
              #debugger
              if existing_name.compute_last_name_distance(contr_last) == 0
                if existing_name.compute_first_distance( contr_first) == 0
                  if existing_name.compute_middle_distance( contr_mid) == 0
                    # this is an alternative of name of an existing contributor
                    @contributor = existing_contrib
                    break
                  end
                end
              end
            end
          end
          break if !@contributor.nil?
        end
        if @contributor.nil?
          @contributor = Contributor.create
        end
      end
    else
      # a match
      @contributor = @contributors[0]
    end

    @names = ContributorName.where(:last_name => contr_last,
                                   :suffix => contr_suf,
                                   :first => contr_first,
                                   :middle => contr_mid,
                                   :contributor_type => contr_type)
    if @names.nil? || @names.empty?
      @name = ContributorName.create!(:last_name => contr_last,
                                     :suffix => contr_suf,
                                     :first => contr_first,
                                     :middle => contr_mid,
                                     :contributor_type => contr_type,
                                     :contributor_id => @contributor.id)
    else
      @name = @names[0]
    end
    contributor_name_id = @name.id

    @addresses = ContributorAddress.where(:city => contr_city,
                                           :mailing => contr_mailing ,
                                           :state => contr_st ,
                                           :zip => contr_zip)
    if @addresses.nil? || @addresses.empty?
      @address = ContributorAddress.create!(:city => contr_city,
                                            :mailing => contr_mailing ,
                                            :state => contr_st ,
                                            :zip => contr_zip)
    else
      @address = @addresses[0]
    end
    contributor_address_id = @address.id

    @contributor

  end


  def get_or_make_candidate
    @candidates = Candidate.where(:year => election_year,
                                  :last => cand_last,
                                  :first => cand_first,
                                  :middle => cand_mid,
                                  :party => party,
                                  :district => district,
                                  :office => office)
    if @candidates.nil?  || @candidates.empty?
      candidate = Candidate.create!(:elected => true,
                                   :year => election_year,
                                   :last => cand_last,
                                   :first => cand_first,
                                   :middle => cand_mid,
                                   :party => party,
                                   :district => district,
                                   :office => office)
    else
      candidate = @candidates[0]
    end
    candidate_id = candidate.id
    candidate
  end

  def get_or_make_contribution (contributor, candidate)
    contribution = Contribution.create!(:date => contr_date,
                                      :amount => contr_amount,
                                      :candidate_id => candidate.id,
                                      :contributor_id => contributor.id)
    contribution.id
  end


  def create_associated_models

    @contributor = get_or_make_contributor

    @candidate = get_or_make_candidate

    contribution_id = get_or_make_contribution @contributor, @candidate

  end
end
