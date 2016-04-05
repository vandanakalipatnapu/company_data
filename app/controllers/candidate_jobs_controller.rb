class CandidateJobsController < ApplicationController
	def create
		@candidate_job=CandidateJob.new(candidate_params)
		if @candidate_job.save
			redirect_to @company
		else
			render 'new'
		end
	end
		private
			def candidate_params
				params[:candidate].permit(:company_id,:job_id)
			end
	end
end
