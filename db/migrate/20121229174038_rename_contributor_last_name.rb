class RenameContributorLastName < ActiveRecord::Migration
  def up
    rename_column  :contributor_names, :last, :last_name
  end

  def down
  end
end
