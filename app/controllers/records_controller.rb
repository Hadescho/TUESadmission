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
    @record = Record.new
    @record.record_type_id = params[:record_type_id]
  end

  def create
    @record = Record.new
    @record.record_type_id = params[:record][:record_type_id]
    @record.name = params[:record][:name]
    @record.properties = params[:record][:properties]
    if @record.save
      redirect_to :root
    else
      render action: "new"
      render "params"
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.updata_attributes(params[:reocrd])
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
