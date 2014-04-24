# -*- encoding : utf-8 -*-
class CampaignsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @campaigns = Campaign.all 
  end

  def new
    @campaign = Campaign.new
    @record_types = []
    RecordType.all.each { |rt| @record_types<< [rt.name,rt.id]}

  end

  def create
    @campaign = Campaign.new(params[:campaign])
    if @campaign.save
      render status: :ok 
    else
      flash[:alert] = "Грешка при създаването на кампанията. Моля опитайте отново"
      render "campaigns#new"
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def show
    if params[:id].nil?
      @campaign = Campaign.last
    else  
      @campaign = Campaign.find(params[:id])
    end

    if @campaign.nil?
      @campaign = Campaign.new
      @record_types = RecordType.all
      render "new"
    end

    respond_to do |format|
      format.html
      format.csv {send_data @campaign.to_csv}
      format.xls
    end
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(params[:campaign])
      flash[:success] = "Кампанията бе успешно обновлена"
      redirect_to @campaign
    else
      flash[:alert] = "Кампанията не бе успешно обновлена. Моля опитайте отново"
    end
  end

  def modify_records
    params[:record_ids].each do |id|
      Record.find(id).destroy
    end
    redirect_to Campaign.find(params[:campaign_id])
  end
  
end
