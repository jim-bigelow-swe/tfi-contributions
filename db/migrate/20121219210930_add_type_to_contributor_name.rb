class AddTypeToContributorName < ActiveRecord::Migration
  def change
    add_column :contributor_names, :type, :string
  end
end
