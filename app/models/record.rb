# -*- encoding : utf-8 -*-
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

  def calculate_bal
    self.properties.update(bal: ((self.properties["БЕЛ - училище".to_sym].to_f + self.properties["Физика - училище".to_sym].to_f + self.properties["Математика - изпит".to_sym].to_f + self.properties["Български - изпит".to_sym].to_f + 4* self.properties["Математика - ТУЕС".to_sym].to_f).to_s) )
  end

end
