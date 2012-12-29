class AddDefaultValueToElectedInCandidate < ActiveRecord::Migration
  def change
    change_column :candidates, :elected, :boolean, :default => 0
  end
end
