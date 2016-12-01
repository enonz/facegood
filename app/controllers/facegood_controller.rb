class FacegoodController < ApplicationController
	layout 'facegood', only: [:facegood]
	def index

	end

	def facegood
		if params[:post].present?
			post = Post.new
			post.user_id = params[:post][:user_id]
			post.content = params[:post][:content]
			post.save
		end
		@posts = Post.all.order('id DESC')
		@user = current_user
	end
end