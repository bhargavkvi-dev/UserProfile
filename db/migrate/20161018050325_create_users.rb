class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :first_name
    	t.string :last_name
    	t.string :gender
    	t.string :company
    	t.string :city
    	t.string :email
    	t.string :mobile_number
    	t.string :technology
    	t.boolean :job_status, default: false
    	t.string :description


      t.timestamps null: false
    end
  end
end
