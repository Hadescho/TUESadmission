# -*- encoding : utf-8 -*-
class RecordType < ActiveRecord::Base
   attr_accessible :name, :fields_attributes
   has_many :fields, class_name: "RecordField"
   accepts_nested_attributes_for :fields, allow_destroy: true
   alias_attribute :record_type_id, :id
end
