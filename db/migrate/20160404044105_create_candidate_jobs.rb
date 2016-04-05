class CreateCandidateJobs < ActiveRecord::Migration
  def change
    create_table :candidate_jobs do |t|
    	t.integer :candidate_id
    	t.integer :job_id

      t.timestamps null: false
    end
  end
end
