# -*- encoding : utf-8 -*-

class Record < ActiveRecord::Base
  attr_accessible :name, :record_type_id, :properties, :campaign_id, :entry_number
  belongs_to :record_type
  belongs_to :campaign
  serialize :properties, Hash

  # validate :validate_properties

  before_save :calculate_bal
  before_update :calculate_bal

  # def validate_properties
  # 	self.properties.each do |p|
  # 		if p.blank? 
  #       self.errors.add field.name, "не трябва да е празно"
  # 		end
  # 	end
  # end

  # def self.search(search)
  #   return if search.blank?
  #   search_condition = "%" + search + "%"
  #   find(:all, :conditions => ['#{self.properties["Собствено име".to_sym]} LIKE ?', search_condition])
  # end

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
