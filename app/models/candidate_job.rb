class CandidateJob < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :job

	validates_uniqueness_of :candidate_id, :scope => :job_id
end
