# -*- encoding : utf-8 -*-
class CreateCnRecords < ActiveRecord::Migration
  def change
  	create_table :cn_records do |t|
  		t.integer :campaign_id
  		t.integer :record_id
  	end
  end
end
