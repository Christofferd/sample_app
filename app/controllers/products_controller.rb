class ProductsController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
	  	@search = @user.products.search do
	    fulltext params[:search]
	  end
	  @products = @search.results
	end

	private

		def sort_column
			Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end
end