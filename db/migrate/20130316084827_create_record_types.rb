# -*- encoding : utf-8 -*-
class CreateRecordTypes < ActiveRecord::Migration
  def change
    create_table :record_types do |t|

      t.timestamps
    end
  end
end
