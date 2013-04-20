# -*- encoding : utf-8 -*-
class AddNameToRecordType < ActiveRecord::Migration
  def change
  	add_column :record_types, :name, :string
  end
end
