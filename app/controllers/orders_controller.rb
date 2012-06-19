class OrdersController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
		@orders = @user.orders.search(params[:search]).order(sort_column + ' ' + sort_direction)
	end

	private

		def sort_column
			Order.column_names.include?(params[:sort]) ? params[:sort] : "number"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
		end
end