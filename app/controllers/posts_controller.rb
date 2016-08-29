class PostsController < ApplicationController
  before_action :require_user, except: :show

  def show
    load_post
  end

  def new
    load_blog

    @post = @blog.posts.build

    authorize! :create, @post
  end

  def create
    load_blog

    @post = @blog.posts.build(post_params)

    authorize! :create, @post

    if @post.save
      redirect_to blog_post_path(@blog, @post)
    else
      render :new
    end
  end

  def edit
    load_post

    authorize! :update, @post
  end

  def update
    load_post

    authorize! :update, @post

    if @post.update_attributes(post_params)
      redirect_to blog_post_path(@blog, @post)
    else
      render :edit
    end
  end

  def destroy
    load_post

    authorize! :destroy, @post

    @post.destroy

    redirect_to blog_path(@blog)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def load_blog
    @blog ||= Blog.includes(:user).find_by(slug: params[:blog_id])
  end

  def load_post
    load_blog

    @post ||= @blog.posts.find(params[:id])
  end
end
