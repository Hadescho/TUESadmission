class AddRecordTypeIdToCampaign < ActiveRecord::Migration
  def change
  	add_column :campaigns, :record_type_id, :integer
  end
end
