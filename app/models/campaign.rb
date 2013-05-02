# -*- encoding : utf-8 -*-
class Campaign < ActiveRecord::Base
	attr_accessible :description, :name, :records
	has_and_belongs_to_many :records
	has_and_belongs_to_many :sp_container, class_name:"Record", join_table: :sp_records
	has_and_belongs_to_many :cn_container, class_name:"Record", join_table: :cn_records

	
	def bal_aligment 
	    records_array = self.records.all
	    records_array.each do |r|
	      if !r.properties.key? :bal
	        r.calculate_bal
	        r.save
	      end
	      r.properties["bal"] = r.properties["bal"].to_f
	    end

	    records_array.sort_by {|r| r.properties[:bal]}.reverse
 	end
end
