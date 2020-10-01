class TrLoansController < ApplicationController
  def index
      @tr_loans = TrLoan.where(is_active: true) 
  end

   def show
    @tr_loan = TrLoan.find(params[:id])
  end

  def new
    @tr_loan = TrLoan.new
  end

  def create
    @tr_loans = TrLoan.new(tr_loans_params)

    if @tr_loans.save
      redirect_to tr_loans_path, notice: "Data Successfuly Created"
    else
      render 'new'
    end

  end

  def edit
    @tr_loans = TrLoan.find(params[:id])
  end

  def update
    @tr_loans = TrLoan.find(params[:id])

    if @tr_loans.update(tr_loans_params)
      redirect_to tr_loans_path, notice: "Data Successfuly Edited"
    else
      render 'edit'
    end

  end

  def destroy
    @tr_loans = TrLoan.find(params[:id])
    @tr_loans.update_attributes(:is_active => false)
    redirect_to tr_loans_path, notice: "Data Successfuly Deleted"
  end

  

  private
  def tr_loans_params
    params.require(:tr_loan).permit(:id, :member_name, :member_phone, :member_email, :ms_book_id)
  end
end
