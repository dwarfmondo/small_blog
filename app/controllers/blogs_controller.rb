class BlogsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user).order('created_at DESC')
  end

  def show
    @blog = Blog.includes(:user, :posts).order('posts.created_at DESC').references(:posts).find_by(slug: params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    load_blog

    authorize! :update, @blog
  end

  def update
    load_blog

    authorize! :update, @blog
  end

  def delete
    load_blog

    authorize! :destroy, @blog
  end

  def destroy
    load_blog

    authorize! :destroy, @blog
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :slug)
  end

  def load_blog
    @blog ||= Blog.includes(:user).find_by(slug: params[:id])
  end
end
