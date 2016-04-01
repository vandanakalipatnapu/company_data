class Company < ActiveRecord::Base
	has_many :jobs
	
	validates :name,:website,presence:true,:uniqueness =>true
	validates :name,:city,format:{with:/\A[a-zA-Z|\,|\,|\s]+\z/, message: "Enter letters only"}
end
