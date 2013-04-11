#encoding: UTF-8
class RecordsController < ApplicationController
  def index
    @records = Campaign.find(params[:campaign_id]).records.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @record = @campaign.records.new
    @record.record_type_id = params[:record_type_id]
  end

  def create
    @record = Campaign.find(params[:campaign_id]).records.new
    @record.record_type_id = params[:record][:record_type_id]
    @record.name = params[:record][:name]
    @record.properties = params[:record][:properties]
    if @record.save
      redirect_to @record
    else
      render action: "new"
      flash[:alert] = "Записът не бе създанен успешно. Моля опитайте отново."
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.updata_attributes(params[:record])
      redirect_to @record
    else
      render action: "edit"
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
  end

end
