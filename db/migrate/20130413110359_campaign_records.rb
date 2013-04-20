# -*- encoding : utf-8 -*-
class CampaignRecords < ActiveRecord::Migration
  def change
  	create_table :campaign_records do |t|
  		t.integer :campaign_id
  		t.integer :record_id
  	end
  end
end
