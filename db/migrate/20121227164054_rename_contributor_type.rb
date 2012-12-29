class RenameContributorType < ActiveRecord::Migration
  def up
    rename_column :contributor_names, :type, :contributor_type
  end

  def down
  end
end
