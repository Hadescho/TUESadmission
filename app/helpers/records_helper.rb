# -*- encoding : utf-8 -*-
module RecordsHelper
  def calculate_bal record
  	record.properties.update(bal: ((record.properties["Математика - училище".to_sym].to_f + record.properties["Физика - училище".to_sym].to_f + 2*record.properties["Математика - изпит".to_sym].to_f + 2*record.properties["Български - изпит".to_sym].to_f).to_s))
  end
end
