# -*- encoding : utf-8 -*-
#encoding: UTF-8
class Record < ActiveRecord::Base
  attr_accessible :name, :record_type_id, :properties, :campaign_id
  belongs_to :record_type
  belongs_to :campaign
  serialize :properties, Hash
  #validate :validate_properties
  validate :validate_no_whitespaces


  #def validate_properties
  #	record_type.fields.each do |field|
  #		if field.required 
  #     errors.add field.name, "не трябва да е празно"
  #		end
  #	end
  #end

  def validate_no_whitespaces
    properties.each do |key, val|
      if !val.match(/^\S*$/)
        errors.add key , "не трябва да има разстояния"
      end
    end
  end
end
