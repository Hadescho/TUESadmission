class RecordField < ActiveRecord::Base
  belongs_to :record_type
  attr_accessible :field_type, :name, :required
end
