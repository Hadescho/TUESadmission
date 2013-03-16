class AddNameToRecordType < ActiveRecord::Migration
  def change
  	add_column :record_types, :name, :string
  end
end
