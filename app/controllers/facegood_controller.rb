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

	def like
		if params['post_id'].present? && params['user_id'].present?
			like = Like.new
			like.user_id = params['user_id']
			like.post_id = params['post_id']
			like.save

		end
		redirect_to root_path
	end

	def post_comment
		if params['comment'].present?
			comment = Comment.new
			comment.post_id = params['post_id']
			comment.user_id = params['user_id']
			comment.content = params['comment']
			comment.save
			if params['action_name'] == 'facegood'
				redirect_to root_path
			else
				redirect_to "#{params['post_id']}"
			end
		else
			redirect_to root_path
		end
	end

	def follow
		if params['user_id'].present? && params['followed_id'].present?
			follow = Follow.new
			follow.followed = User.find(params['followed_id'])
			follow.follower = User.find(params['user_id'])
			follow.save
			if params['action_name'] == 'facegood'
				redirect_to root_path
			else
				redirect_to "#{params['post_id']}"
			end
		else
			redirect_to root_path
		end
	end

	def show
		if params['post_id'].present?
			@user = current_user
			@post = Post.find(params['post_id'])
		else
			redirect_to root_path
		end
	end
end