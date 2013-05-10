# -*- encoding : utf-8 -*-
class RecordType < ActiveRecord::Base
   attr_accessible :name, :fields_attributes
   has_many :fields, class_name: "RecordField"
   accepts_nested_attributes_for :fields, allow_destroy: true
   alias_attribute :record_type_id, :id

   # validate :no_whitespaces

   # def no_whitespaces
	  #  fields.each do |f|
		 #   if f.name.match(/^\S*$/)
		 #      errors.add f.name , "не трябва да има разстояния"
		 #   end
	  #  end
   # end

   #Оказа се че нямам нужда от подобна валидация стига при извикването от датабазата да си поигравам малко с стрингове
end
