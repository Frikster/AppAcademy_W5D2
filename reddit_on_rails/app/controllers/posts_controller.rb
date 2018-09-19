class PostsController < ApplicationController
  before_action :require_login, except: [:show]

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]

    # post_params[:sub_ids].each do |sub_id|
    #   subreddit = Sub.find(sub_id)
    #
    # end
    #
    # @post.subreddits =


    if @post.save
      redirect_to sub_post_url(id: @post.id, sub_id: params[:sub_id])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.where(id: params[:id])
    @post.update(post_params)
    flash[:errors] = @post.errors.full_messages
    redirect_to sub_post_url(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
