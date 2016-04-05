 class CandidatesController < ApplicationController
# 	def create
# 		@company = Company.find(params[:company_id])
# 		@job = Job.find(params[:job_id])
# 		@candidate = Candidate.new(candidate_params)
# 	    if @candidate.save
# 	    	@candidate_job = CandidateJob.new(candidate_id:@candidate.id,job_id:@job.id)
	    	
# 	    	redirect_to company_job_path(@company.id,@job.id)			
# 	    else
# 	   		render 'new'
# 	   	end 
# 	end
	
    def new
    	@job = Job.find(params[:job_id])
		@company = Company.find(params[:company_id])
		@candidate = Candidate.new		
	end

	def edit
		@job = Job.find(params[:job_id])
		@company = Company.find(params[:company_id])
		@candidate = Candidate.find(params[:id])
	end

	def update
		@job = Job.find(params[:job_id])
		@company = Company.find(params[:company_id])
		@candidate = Candidate.find(params[:id])
		if @candidate.update(candidate_params)
			redirect_to company_job_path(@company,@job)
		else
			redirect_to company_job_path(@company,@job)
		end
	end

	def destroy
		@job = Job.find(params[:job_id])
		@company = Company.find(params[:company_id])
		@candidate = Candidate.find(params[:id])
		@candidate.destroy
		redirect_to company_job_path(@company,@job)

	end

	def create
        @company = Company.find(params[:company_id])
        @job = Job.find(params[:job_id])
        candidates = Candidate.where(email: params[:candidate][:email])

        if candidates.present?
            @candidate = candidates.first
            is_success = @candidate.update(candidate_params)
        else
            @candidate = Candidate.new(candidate_params)
            is_success = @candidate.save
        end

        if is_success
            @candidate_job = CandidateJob.new(job_id: params[:job_id],candidate_id: @candidate.id)
            @candidate_job.save
            redirect_to company_job_path(@company,@job)
        else
            render 'new'
        end

    end 

    def show
    	@company=Company.find(params[:company_id])
    	@job=Job.find(params[:job_id])
    	@candidate=Candidate.find(params[:id])
    	@candidates=@candidate.jobs
   	end   


	


	private 
		def candidate_params
			params[:candidate].permit(:name,:email,:phno)
		end

	
end

