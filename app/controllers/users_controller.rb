class UsersController < ApplicationController

	def log_out
		sign_out(current_user)
		redirect_to root_path
	end
end