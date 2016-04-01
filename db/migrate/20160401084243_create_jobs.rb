class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.string :skill_set
    	t.integer :experience
    	t.integer :company_id


      t.timestamps null: false
    end
  end
end
