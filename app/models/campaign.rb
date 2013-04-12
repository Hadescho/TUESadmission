class Campaign < ActiveRecord::Base
	attr_accessible :description, :name, :records
	has_and_belongs_to_many :records

end
