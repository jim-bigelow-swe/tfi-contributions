class CreateAddressNameJoinTable < ActiveRecord::Migration
  def change
    create_table :contributor_addresses_contributor_names, :id => false do |t|
      t.integer :contributor_address_id
      t.integer :contributor_name_id
    end
    add_index :contributor_addresses_contributor_names,  :contributor_address_id, :name => 'address_index'
    add_index :contributor_addresses_contributor_names,  :contributor_name_id, :name => 'name_index'
    #add foreign key, if not sqlite
#    execute <<-SQL
#      ALTER TABLE contributor_addresses_contributor_names
#        ADD CONSTRAINT  fk_contributor_addresses_contributor_names_address
#        FOREIGN KEY (contributor_address_id)
#        REFERENCES contributor_addresses(id)
#    SQL
#    execute <<-SQL
#      ALTER TABLE contributor_addresses_contributor_names
#        ADD CONSTRAINT  fk_contributor_addresses_contributor_names_name
#        FOREIGN KEY (contributor_name_id)
#        REFERENCES contributor_names(id)
#    SQL
  end
end
