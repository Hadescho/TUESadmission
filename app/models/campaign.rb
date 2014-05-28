# -*- encoding : utf-8 -*-
class Campaign < ActiveRecord::Base
	attr_accessible :description, :name, :records, :record_type_id
	has_and_belongs_to_many :records
	has_and_belongs_to_many :sp_container, class_name:"Record", join_table: :sp_records
	has_and_belongs_to_many :cn_container, class_name:"Record", join_table: :cn_records

	def to_csv
		csv = CSV.generate( :quote_char => "\0") do |csv|
			array = ""
			
			records.first.attributes.each_key do |key|
				array << key + "," unless key =~ /properties/
			end

			records.first.attributes["properties"].each_key do |key|
				array << key + ","	
			end

			array = array[0..array.length-2].chomp
			
			csv << [array.strip]

			self.records.each do |record|
				array = ""
				record.attributes.each do |key, value|
					array << value.to_s + "," unless key =~ /properties/
				end
				record.attributes["properties"].each do |key,value|
					array << value.to_s + ","
				end

				array = array[0..array.length-2].chomp
			
				csv << [array]
			end
		end
		csv.gsub!(/\0/, '')
	end
	
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

 	def specialties_alignment
 		records_array = bal_aligment
 		puts "============================ #{records_array.size} ==================================="
 		while (sp_container.size < 29 || cn_container.size < 29 ) && !records_array.empty? do
	 		records_array.each do |r|
	 			if r.properties["Желание1".to_sym].to_i == 1 && sp_container.size < 29
	 				puts "------------------------------- Vliza v Jelanie 1 sp ---------------------------"
	 				sp_container<< r
	 				records_array.delete_if {|x| x == r}
	 			elsif r.properties["Желание1".to_sym].to_i == 2 && cn_container.size < 29
	 				puts "------------------------------- Vliza v Jelanie 1 cn ---------------------------"
	 				cn_container<< r
	 				records_array.delete_if {|x| x == r}
	 			elsif r.properties["Желание2".to_sym].to_i == 1 && sp_container.size < 29
	 				puts "------------------------------- Vliza v Jelanie 2 sp ---------------------------"
	 				sp_container<< r
	 				records_array.delete_if {|x| x == r}
	 			elsif r.properties["Желание2".to_sym].to_i == 2 && cn_container.size < 29
	 				puts "------------------------------- Vliza v Jelanie 2 cn ---------------------------"
	 				cn_container<< r
	 				records_array.delete_if {|x| x == r}
	 			end
	 		end
 		end
 		self.save	
 	end


end


# SP = 1 / CN = 2