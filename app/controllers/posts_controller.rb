class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice:"Que pasa Jose! Tu articulo fue guardado correctamente"
		else
			render 'new', notice:"Oh no, Jose! No fue posible guardar el post."
		end
	end

	def show

	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Bien! Tu articulo fue actualizado correctamente."
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :content, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
