class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save!
			flash[:success] = "Successfully added the user"
			redirect_to @user
		else
			flash[:failure] = "Something is screwed. Please check the errors !"
			render 'new'
		end
		
			# flash a message ? 
			# and then redirect to where ?
	  		#flash[:success] = "Welcome to the Sample App!"
	   	# else
		# 	render 'new'
		# end

	end

	def index
		@users = User.all
	end
	def dummy
		User.create(name: 'gautam', email: 'gautam1@moontara.com')
	end

	def show
		@user = User.find(params[:id])
	end


	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user 
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:success] = "Successfully deleted the user"
			respond_to do |format|
				format.html { redirect_to :action => "index" }
				format.js
			end
		else
			flash[:failure] = "Failed to delete the user"
			respond_to do |format|
				format.html { redirect_to :action => "index" }
				format.js
			end
		end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
			:password_confirmation)
	end


end
