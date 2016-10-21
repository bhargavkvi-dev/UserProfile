class UsersController < ApplicationController

 helper_method :sort_column, :sort_direction
 

	def index
	    @users = User.filter(params[:first_name], params[:last_name], params[:city], params[:gender], params[:technology]).order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 3)   
    end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path, notice: "Successfully created a new User"
		else
			render action: "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path, notice: "Successfully update User"
		else
			render action: "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, notice: "Successfully deleted User"
	end

	private

	def user_params
		params[:user].permit(:first_name, :last_name, :gender, :company, :city, :email, :mobile_number, :technology, :job_status, :description)
	end

	def sortable_columns
    	["first_name", "last_name", "company", "job_status"]
    end

    def sort_column
    	hash = {"Last Name" => "last_name", "First Name" => "first_name", "Company" => "company", "Job Status" => "job_status"}
    	s = hash[params[:column]]
    	unless s.present?
    		s = "first_name"
    	end
    	s 
	end

	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end

 

end
