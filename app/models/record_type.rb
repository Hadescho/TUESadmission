# -*- encoding : utf-8 -*-
class RecordType < ActiveRecord::Base
   attr_accessible :name, :fields_attributes
   has_many :fields, class_name: "RecordField"
   accepts_nested_attributes_for :fields, allow_destroy: true
   alias_attribute :record_type_id, :id

   before_save do
      self.fields << RecordField.create({name:"Собствено име",field_type: :text_field})
      self.fields << RecordField.create({name:"Бащино име",field_type: :text_field})
      self.fields << RecordField.create({name:"Фамилно име",field_type: :text_field})
      self.fields << RecordField.create({name:"ЕГН",field_type: :text_field})
      self.fields << RecordField.create({name:"БЕЛ - училище",field_type: :text_field})
      self.fields << RecordField.create({name:"Физика - училище",field_type: :text_field})
      self.fields << RecordField.create({name:"Математика - изпит",field_type: :text_field})
      self.fields << RecordField.create({name:"Български - изпит",field_type: :text_field})
      self.fields << RecordField.create({name:"Математика - ТУЕС",field_type: :text_field})
      self.fields << RecordField.create({name:"Желание1",field_type: :text_field})
      self.fields << RecordField.create({name:"Желание2",field_type: :text_field})
      self.fields << RecordField.create({name:"Имена на родител",field_type: :text_field})
      self.fields << RecordField.create({name:"Адрес",field_type: :text_field})
      self.fields << RecordField.create({name:"Домашен телефон",field_type: :text_field})
      self.fields << RecordField.create({name:"Мобилен телефон",field_type: :text_field})
      self.fields << RecordField.create({name:"Мейл",field_type: :text_field})
      self.fields << RecordField.create({name:"Училище",field_type: :text_field})
   end

   # validate :no_whitespaces

   # def no_whitespaces
	  #  fields.each do |f|
		 #   if f.name.match(/^\S*$/)
		 #      errors.add f.name , "не трябва да има разстояния"
		 #   end
	  #  end
   # end

   #Оказа се че нямам нужда от подобна валидация стига при извикването от датабазата да си поигравам малко с стрингове
end
