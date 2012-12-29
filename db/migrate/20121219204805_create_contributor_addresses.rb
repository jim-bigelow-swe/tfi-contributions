class CreateContributorAddresses < ActiveRecord::Migration
  def change
    create_table :contributor_addresses do |t|
      t.string :mailing
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
