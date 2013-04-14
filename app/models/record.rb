#encoding: UTF-8
class Record < ActiveRecord::Base
  attr_accessible :name, :record_type_id, :properties, :campaign_id
  belongs_to :record_type
  belongs_to :campaign
  serialize :properties, Hash
  #validate :validate_properties


  #def validate_properties
  #	record_type.fields.each do |field|
  #		if field.required 
  #     errors.add field.name, "не трябва да е празно"
  #		end
  #	end
  #end
end
