class Job < ActiveRecord::Base

	belongs_to :company

	validates :title,:skill_set,:experience,:company_id,presence:true
	validates :title,:skill_set ,format:{with:/\A[a-zA-Z|\,|\.|\s]+\z/, message: "Enter letters only"}
	validates :company_id,:experience,format:{with:/\A[0-9]|\s|\.]\z/,message: "Enter numbers only"}

end
