class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new(record_type_id: params[:record_type_id])
  end

  def create
    @record = Record.new(params[:record])
    if @record.save
      redirect_to @product
    else
      render action: "new"
  end

  def update
    @record = Record.find(params[:id])
    if @record.updata_attributes(params[:reocrd])
      redirect_to @record
    else
      render action: "edit"
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_url
  end
end
