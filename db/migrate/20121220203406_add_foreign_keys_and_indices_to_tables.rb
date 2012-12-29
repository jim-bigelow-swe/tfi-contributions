class AddForeignKeysAndIndicesToTables < ActiveRecord::Migration
  def change
    add_column :contribution_records, :candidate_id, :integer
    add_column :contribution_records, :contribution_id, :integer
    add_column :contribution_records, :contributor_name_id, :integer
    add_column :contribution_records, :contributor_address_id, :integer
    add_index  :contribution_records, ["candidate_id"]
    add_index  :contribution_records, ["contribution_id"]
    add_index  :contribution_records, ["contributor_name_id"]
    add_index  :contribution_records, ["contributor_address_id"]

    add_column :contributions, :contribution_record_id, :integer
    add_column :contributions, :candidate_id, :integer
    add_column :contributions, :contributor_id, :integer
    add_index  :contributions, ["contribution_record_id"]
    add_index  :contributions, ["candidate_id"]
    add_index  :contributions, ["contributor_id"]

    add_column :contributor_names, :contribution_record_id, :integer
    add_column :contributor_names, :contributor_id, :integer
    add_index  :contributor_names, ["contribution_record_id"]
    add_index  :contributor_names, ["contributor_id"]

    add_column :contributor_addresses, :contribution_record_id, :integer
    add_index  :contributor_addresses, ["contribution_record_id"]
  end
end
