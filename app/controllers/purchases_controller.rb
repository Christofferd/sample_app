class PurchasesController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
			@search = @user.purchases.search do
			fulltext params[:search]
		end
		@purchases = @search.results
	end

	private

		def sort_column
			Purchase.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end
end