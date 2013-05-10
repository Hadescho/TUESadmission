# -*- encoding : utf-8 -*-

class Record < ActiveRecord::Base
  attr_accessible :name, :record_type_id, :properties, :campaign_id
  belongs_to :record_type
  belongs_to :campaign
  serialize :properties, Hash
  #validate :validate_properties

  before_save :calculate_bal


  #def validate_properties
  #	record_type.fields.each do |field|
  #		if field.required 
  #     errors.add field.name, "не трябва да е празно"
  #		end
  #	end
  #end

  def calculate_bal
    bel_school = self.properties["БЕЛ - училище".to_sym].to_f
    physics_school = self.properties["Физика - училище".to_sym].to_f
    national_math = self.properties["Математика - изпит".to_sym].to_f
    national_bel = self.properties["Български - изпит".to_sym].to_f
    elsys_math = self.properties["Математика - ТУЕС".to_sym].to_f
    
    bal_sum = bel_school + physics_school + national_bel + national_math + (4 * elsys_math)
    self.properties.update(bal: bal_sum.round(4))
  end

end
