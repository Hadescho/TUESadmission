# -*- encoding : utf-8 -*-
class CreateSpRecords < ActiveRecord::Migration
  def change
  	create_table :sp_records do |t|
  		t.integer :campaign_id
  		t.integer :record_id
	end
  end
end
