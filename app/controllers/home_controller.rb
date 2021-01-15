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
		today_date = params[:borrow_date]
		if status == 'Borrow'
		@tr_loan = TrLoan.new(
			:member_name => member.name,
			:member_phone => member.phone,
			:member_email => member.email,
			:ms_book_id => 	book_id,
			:status => status,
			:borrow_date => today_date
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
			borrow_date = @tr_loan.borrow_date
			borrow_dates = borrow_date.to_date
			today_dates = today_date.to_date
			duration = @tr_loan.duration.to_i
			gap = (today_dates - borrow_dates).to_i
			gap_c = gap - duration
			if gap > duration
				bill = gap_c * 1000
			elsif gap <= duration
				bill = 0
			end	
			@tr_loan.update(
				:member_name => member.name,
				:member_phone => member.phone,
				:member_email => member.email,
				:ms_book_id => 	book_id,
				:status => status,
				:duration => duration,
				:bill => bill,
				:borrow_date => borrow_date,
				:return_date => today_date)
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