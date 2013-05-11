class AddCidToRecord < ActiveRecord::Migration
  def change
 	add_column :records, :entry_number, :integer
  end
end
