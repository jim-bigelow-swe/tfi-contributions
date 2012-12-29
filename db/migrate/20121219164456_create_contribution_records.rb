class CreateContributionRecords < ActiveRecord::Migration
  def change
    create_table :contribution_records do |t|
      t.date :election_year
      t.string :cand_last
      t.string :cand_suf
      t.string :cand_first
      t.string :cand_mid
      t.string :party
      t.string :district
      t.string :office
      t.date :contr_date
      t.decimal :contr_amount
      t.string :contr_type
      t.string :contr_last
      t.string :contr_suf
      t.string :contr_first
      t.string :contr_mid
      t.string :contr_mailing
      t.string :contr_city
      t.string :contr_st
      t.string :contr_zip

      t.timestamps
    end
  end
end
