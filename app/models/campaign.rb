class Campaign < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :records ,through: :CampaignRecordRelations ,foreign_key: "record_id"
   accepts_nested_attributes_for :records
end
