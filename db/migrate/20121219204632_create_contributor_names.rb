class CreateContributorNames < ActiveRecord::Migration
  def change
    create_table :contributor_names do |t|
      t.string :last
      t.string :suffix
      t.string :first
      t.string :middle

      t.timestamps
    end
  end
end
