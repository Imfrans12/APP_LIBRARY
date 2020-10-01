class MsMembersController < ApplicationController
 

  def index
      @ms_members = MsMember.where(is_active: true) 
  end

   def show
    @ms_member = MsMember.find(params[:id])
  end

  def new
    @ms_member = MsMember.new
  end

  def create
    @ms_members = MsMember.new(ms_members_params)

    if @ms_members.save
      redirect_to ms_members_path, notice: "Data Successfuly Created"
    else
      render 'new'
    end

  end

  def edit
    @ms_members = MsMember.find(params[:id])
  end

  def update
    @ms_members = MsMember.find(params[:id])

    if @ms_members.update(ms_members_params)
      redirect_to ms_members_path, notice: "Data Successfuly Edited"
    else
      render 'edit'
    end

  end

  def destroy
    @ms_members = MsMember.find(params[:id])
    @ms_members.update_attributes(:is_active => false)
    redirect_to ms_members_path, notice: "Data Successfuly Deleted"
  end

  

  private
  def ms_members_params
    params.require(:ms_member).permit(:id, :name, :age, :address, :phone, :email)
  end
end
