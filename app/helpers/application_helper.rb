# -*- encoding : utf-8 -*-
#encoding UTF-8
module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def calculate_bal record
  	record.properties.update(bal: (record.properties["Математика - училище".to_sym].to_f + record.properties["Физика - училище".to_sym].to_f + 2*record.properties["Математика - изпит".to_sym].to_f + 2*record.properties["Български - изпит".to_sym].to_f))
  end
end
