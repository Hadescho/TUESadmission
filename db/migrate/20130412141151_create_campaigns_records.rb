# -*- encoding : utf-8 -*-
class CreateCampaignsRecords < ActiveRecord::Migration
  def change
  	create_table :campaigns_records do |t|
  		t.integer :campaign_id
  		t.integer :record_id
  	end
  end
end
