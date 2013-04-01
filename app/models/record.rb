#encoding: UTF-8
class Record < ActiveRecord::Base
  attr_accessible :name, :record_type_id, :properties
  belongs_to :record_type
  belongs_to :campaign
  serialize :properties, Hash
  validate :validate_properties


  def validate_properties
  	record_type.fields.each do |field|
  		if field.required 
        errors.add field.name, "ne trqbva da e prazno (Zashto ne dava simvoli razlichni ot US-ASCII ?!?)"
  		end
  	end
  end
end
