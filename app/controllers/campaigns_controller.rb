#encoding: UTF-8
class CampaignsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @campaigns = Campaign.all 
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    if @campaign.save
      render status: :ok 
    else
      flash[:alert] = "Грешка при създаването на кампанията. Моля опитайте отново"
      render "Campaigns#new"
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
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    temp = Record.new(params[:campaign][:records])
    @campaign.records<< temp
    @campaign.name = params[:campaign][:name]
    @campaign.description = params[:campaign][:description]
    if @campaign.save()
      flash[:success] = "Кампанията бе успешно обновлена"
      redirect_to :root
    else
      flash[:alert] = "Кампанията не бе успешно обновлена. Моля опитайте отново"
    end
  end
end
