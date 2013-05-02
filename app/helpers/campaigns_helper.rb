# -*- encoding : utf-8 -*-
module CampaignsHelper



  def bal_aligment campaign
    records_array = campaign.records.all
    records_array.each do |r|
      if !r.properties.key? :bal
        r.calculate_bal
        r.save
      end
      r.properties["bal"] = r.properties["bal"].to_f
    end

    records_array.sort_by {|r| r.properties[:bal]}.reverse
  end


  def specialty_aligment 
  	records_array = bla_aligment
  end
end
