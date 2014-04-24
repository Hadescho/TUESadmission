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
    @record = Record.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @record = Record.new
    @record.record_type_id = @campaign.record_type_id
    @record.campaign_id = @campaign.id
    @record.entry_number = Record.where(campaign_id: @campaign.id).all.count + 1
    #the entry number is calculated
    #by adding 1 to the quantity of the campaign records
    @campaign.records << @record
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @record = @campaign.records.new
    @record.record_type_id = params[:record][:record_type_id]
    @record.name = params[:record][:name]
    if !@campaign.records.empty?
      @record.entry_number = @campaign.records.last.entry_number + 1
    else
      @record.entry_number = 1
    end
    @record.properties = params[:record][:properties]
    if @record.save
      redirect_to @record
    else
      render action: "new"
      flash[:alert] = "Записът не бе създанен успешно. Моля опитайте отново."
    end
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @record = Record.find(params[:id])
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
