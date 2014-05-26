# -*- encoding : utf-8 -*-
#encoding: UTF-8
class RecordsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @records = Campaign.find(params[:campaign_id]).records.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @record = Record.find(params[:id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @record = @campaign.records.new
    @record.record_type_id = @campaign.record_type_id
    @record.campaign_id = @campaign.id
  end

  def create
    Campaign.transaction do
      @campaign = Campaign.find(params[:campaign_id])
      @record = @campaign.records.new
      @record.campaign_id = @campaign.id
      @record.record_type_id = @campaign.record_type_id

      if !@campaign.records.empty?
        @record.entry_number = @campaign.records.count + 1
      else
        @record.entry_number = 1
      end

      @record.properties = params[:record][:properties]
      
      if @campaign.records << @record
        redirect_to campaign_record_path(campaign_id: @campaign.id, id: @record.id)
      else
        render action: "new"
        flash[:alert] = "Записът не бе създанен успешно. Моля опитайте отново."
      end
    end
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @record = Record.find(params[:record_id])
    if @record.update_attributes(params[:record])
      redirect_to @campaign
    else
      render status: 500
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
      redirect_to Campaign.find(params[:campaign_id])
    else
      render status: 500
    end
  end

end
