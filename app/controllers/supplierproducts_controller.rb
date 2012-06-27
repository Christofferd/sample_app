class SupplierproductsController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
			@search = @user.supplierproducts.search do
			fulltext params[:search]
			facet(:supplier_id)
			with(:supplier_id, params[:supplier_id]) if params[:supplier_id].present?
		end
		@supplierproducts = @search.results
	end

	def show
		@supplier = Supplier.find(params[:id])
		@search = @supplier.supplierproducts.search do
			fulltext params[:search]
		end
		@supplierproducts = @search.results
	end

	private

		def sort_column
			Supplierproduct.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end
end