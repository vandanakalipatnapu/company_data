class Candidate < ActiveRecord::Base
	has_many :candidate_jobs,dependent: :destroy
	has_many :jobs ,through: :candidate_jobs

	validates :name,:email,:phno,presence:true
	validates :name,format:{with: /\A[a-zA-Z|\,|\,|\s]+\z/, message: "Enter letters only"}
	validates :phno,numericality:true
	# validates :email,format:{with: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/, message: "Enter valid Email"}

end
