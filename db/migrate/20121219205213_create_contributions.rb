class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
