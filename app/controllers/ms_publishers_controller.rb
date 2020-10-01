class MsPublishersController < ApplicationController
  def index
      @ms_publishers = MsPublisher.where(is_active: true) 
  end

   def show
    @ms_publishers = MsPublisher.find(params[:id])
  end

  def new
    @ms_publishers = MsPublisher.new
  end

  def create
    @ms_publishers = MsPublisher.new(ms_publishers_params)

    if @ms_publishers.save
      redirect_to ms_publishers_path, notice: "Data Successfuly Created"
    else
      render 'new'
    end

  end

  def edit
    @ms_publishers = MsPublisher.find(params[:id])
  end

  def update
    @ms_publishers = MsPublisher.find(params[:id])

    if @ms_publishers.update(ms_publishers_params)
      redirect_to ms_publishers_path, notice: "Data Successfuly Edited"
    else
      render 'edit'
    end

  end

  def destroy
    @ms_publishers = MsPublisher.find(params[:id])
    @ms_publishers.update_attributes(:is_active => false)
    redirect_to ms_publishers_path, notice: "Data Successfuly Deleted"
  end

  

  private
  def ms_publishers_params
    params.require(:ms_publisher).permit(:id, :name, :age, :address, :phone, :email)
  end
end
