class CompaniesController < ApplicationController
	layout "header_footer"

	def new
		@company=Company.new
	end


	def create
		@company=Company.new(company_params)
		if @company.save
			
			flash[:success] = "Welcome to the #{@company.name} jobs "
			 redirect_to @company
		else
			render 'new'
		end
	end

	def index
		@companies=Company.all
		# render xml: @companies
	end

	def edit
		@company=Company.find(params[:id])
	end

	def update
		@company=Company.find(params[:id])
		if @company.update(company_params)
			# flash[:success]="updated #{@company.name} "
			redirect_to companies_path
		else
			render 'edit'
		end
	end

	def show
		@company=Company.find(params[:id])
		@job=Job.new
		@jobs=@company.jobs
	end

	def destroy
		@company=Company.find(params[:id])
		@company.destroy
		
	end

	


	private
		def company_params
			params[:company].permit(:name,:city,:website)
		end

end
