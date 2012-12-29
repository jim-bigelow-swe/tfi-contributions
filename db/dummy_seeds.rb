# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contribution_records = [ { :election_year => "2012-01-01",
                           :cand_last => "Man",
                           :cand_first => "He",
                           :cand_mid => "Da",
                           :party => "REP",
                           :district => "1",
                           :office => "Gov",
                           :contr_date => "2012-12-20",
                           :contr_amount => "99",
                           :contr_last => 'Public',
                           :contr_first => 'John',
                           :contr_mid => 'Q.',
                           :contr_type => 'I',
                           :contr_mailing => '100 Main',
                           :contr_city    => 'Anywhere',
                           :contr_st      => 'ID',
                           :contr_zip     => 83704
                         },
                         { :election_year => "2012-01-01",
                           :cand_last => "Man",
                           :cand_first => "He",
                           :cand_mid => "Da",
                           :party => "REP",
                           :district => "1",
                           :office => "Gov",
                           :contr_date => "2012-12-20",
                           :contr_amount => "99",
                           :contr_last => 'Public',
                           :contr_first => 'John',
                           :contr_mid => 'Q.',
                           :contr_type => 'I',
                           :contr_mailing => '100 Main',
                           :contr_city    => 'Anywhere',
                           :contr_st      => 'ID',
                           :contr_zip     => 83704
                         },
                         { :election_year => "2012-01-01",
                           :cand_last => "Man",
                           :cand_first => "He",
                           :cand_mid => "Da",
                           :party => "REP",
                           :district => "1",
                           :office => "Gov",
                           :contr_date => "2012-12-20",
                           :contr_amount => "99",
                           :contr_last => 'Public',
                           :contr_first => 'John',
                           :contr_mid => 'Q.',
                           :contr_type => 'I',
                           :contr_mailing => '100 Main',
                           :contr_city    => 'Anywhere',
                           :contr_st      => 'ID',
                           :contr_zip     => 83704
                         },
                         { :election_year => "2012-01-01",
                           :cand_last => "Man",
                           :cand_first => "He",
                           :cand_mid => "Da",
                           :party => "REP",
                           :district => "1",
                           :office => "Gov",
                           :contr_date => "2012-12-20",
                           :contr_amount => "99",
                           :contr_last => 'Public',
                           :contr_first => 'John',
                           :contr_mid => 'Q.',
                           :contr_type => 'I',
                           :contr_mailing => '100 Main',
                           :contr_city    => 'Anywhere',
                           :contr_st      => 'ID',
                           :contr_zip     => 83704
                         }
                       ]

contribution_records.each do |record|
  ContributionRecord.create!(record)
end
