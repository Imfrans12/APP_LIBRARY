class HomeController < ApplicationController
	skip_before_action :authenticate_ms_user!,:verify_authenticity_token
	def index
		@tr_loans_borrow = TrLoan.all

		render json:{
			values: @tr_loans,
			message: "Success!",
		}, status: 200
	end

	def show
		@tr_loans = TrLoan.find_by_id(params[:id])
		if @tr_loans.present?
			render json: {
				values: @tr_loans,
				message: "Success!",
			}, status: 200
		else
			render json: {
				values: "",
				message: "We Can't found any data!",
			}, status: 400
		end
	end

	def create
		member = MsMember.find_by_id(params[:member_id])
		book_id = params[:ms_book_id]
		status = params[:status]
		if status == 'Borrow'
		@tr_loan = TrLoan.new(
			:member_name => member.name,
			:member_phone => member.phone,
			:member_email => member.email,
			:ms_book_id => 	book_id,
			:status => status
			)

		if @tr_loan.save
			 ActionCable.server.broadcast 'loan',
              tr_loan: @tr_loan
			render json:{
				values: @tr_loan,
				message: "Success!",
			}, status: 200
		else
			render json:{
				values: "",
				message: "Failed!",
			}, status: 400
		end
		elsif status == 'Return'
			@tr_loan = TrLoan.find_by ms_book_id: params[:ms_book_id], status: 'Borrow'
			@tr_loan.update(
				:member_name => member.name,
				:member_phone => member.phone,
				:member_email => member.email,
				:ms_book_id => 	book_id,
				:status => status)
			ActionCable.server.broadcast 'loan',
              tr_loan: @tr_loan
			render json:{
				values: @tr_loan,
				message: "Success!",
			}, status: 200
			end
	end

	private
	def loan_params
		params.permit(:member_name,:member_phone,:member_email,:ms_book_id)
	end
end