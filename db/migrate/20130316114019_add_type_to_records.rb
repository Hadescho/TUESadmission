class AddTypeToRecords < ActiveRecord::Migration
  def change
    add_column :records, :record_type_id, :integer
    add_column :records, :properties, :text
  end
end
