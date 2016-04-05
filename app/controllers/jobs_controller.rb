class JobsController < ApplicationController
	def new
		@company = Company.find(params[:company_id])
		@job = Job.new
	end

	def create
		 # raise params.inspect
		@company = Company.find(params[:company_id])
		@job = @company.jobs.create(job_params)
		if @job.save
			# flash[:success]="#{@job.title} job is added "
			redirect_to @company
		else
			render 'new'
		end
	end

	def edit
		@company = Company.find(params[:company_id])
		@job = Job.find(params[:id])
		# flash[:danger]=" #{@job.title} is updated "
	end

	def update
		@company = Company.find(params[:company_id])
		@job = Job.find(params[:id])
		if @job.update_attributes(job_params)
			redirect_to @company
		else
			redirect_to @company
		end
	end

	def destroy
		@company = Company.find(params[:company_id])
		@job = Job.find(params[:id])
		@job.destroy

	end

	def show
		@company = Company.find(params[:company_id])
		@job = Job.find(params[:id])
		@candidate = Candidate.new
		 @candidate=@job.candidates
	end

	private
		def job_params
			params[:job].permit(:title,:experience,:skill_set)
		end
end
