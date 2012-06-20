class OrdersController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
	  	@search = @user.orders.search do
	    fulltext params[:search]
	  end
	  @orders = @search.results
	end

	private

		def sort_column
			Order.column_names.include?(params[:sort]) ? params[:sort] : "number"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
		end
end