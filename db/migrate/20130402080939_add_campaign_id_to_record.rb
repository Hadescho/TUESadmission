class AddCampaignIdToRecord < ActiveRecord::Migration
  def change
  		add_column :records, :campaign_id, :integer
  end
end
