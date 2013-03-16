class RecordTypesController < ApplicationController
  def index
    @record_types = RecordType.all  
  end

  def show
    @record_type = RecordType.find(params[:id])
  end

  def edit
    @record_type = RecordType.find(params[:id])
  end

  def new
    @record_type = RecordType.new
  end

  def create
    @record_type = RecordType.new(params[:product_type])
    if @record_type.save
      redirect_to @record_type , notice: 'Успешно създаден запис'
    else
      render action: "new"
    end
  end

  def update
    @record_type = RecordType.find(params[:id])
    if @record_type.update_attributes(params[:product_type])
      flash[:success] = "Успешно обновихте записа"
    else
      flash[:alert] = "Имахме проблем с обновяването на записа"
      @record_type.errors.each do |err|
        flash[:alert] += err
      end
    end
  end

  def destroy
    @record_type = RecordType.find(params[:id])
    @record_type.destroy
  end
end
