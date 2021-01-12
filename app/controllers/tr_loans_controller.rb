class TrLoansController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:update]
  def index
      @tr_loans_borrow = TrLoan.where(:status => 'Borrow').last(1)
      @tr_loans_return = TrLoan.where(:status => 'Return').last(1)
      @tr_loans_form = TrLoan.new
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
    tr_loans = TrLoan.where(:id => params[:id])
    tr_loans.update(tr_loans_params)
    if tr_loans
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
    params.permit(:id, :member_name, :member_phone, :member_email, :ms_book_id, :status)
  end
end
