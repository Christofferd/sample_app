class SuppliersController < ApplicationController

	helper_method :sort_column, :sort_direction

	def index
		@user = current_user
	  @search = @user.suppliers.search do
	    fulltext params[:search]
	  end
	  @suppliers = @search.results
	end

	def show
		@supplier = Supplier.find(params[:id])
	end

	def edit
		@supplier = Supplier.find(params[:id])
	end

	def update
		@supplier = Supplier.find(params[:id])
		@supplier.update_attributes(params[:supplier])
		redirect_to edit_supplier_path
		flash[:success] = "Supplier has been updated!"
	end

	def destroy
		Supplier.find(params[:id]).destroy
		flash[:success] = "Supplier has been destroyed!"
		redirect_to suppliers_path
	end

	def new
		@supplier = Supplier.new
	end

	def create
		@user = current_user
		@supplier = @user.suppliers.new(params[:supplier])
		if @supplier.save
			flash[:success] = "Supplier has been created!"
			redirect_to supplier_path(@supplier)
		else
			render :action => 'new'
		end
	end

	private

		def sort_column
			Supplier.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end
end