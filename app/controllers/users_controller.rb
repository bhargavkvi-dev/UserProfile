class UsersController < ApplicationController
	def index
		@users = User.all
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
end