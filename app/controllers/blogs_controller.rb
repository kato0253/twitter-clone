class BlogsController < ApplicationController

  before_action :set_blog, only: [:edit, :update, :destroy]

  def new

    @blog = Blog.new

  end

  def index

    @blogs = Blog.all

  end

  def confirm

    @blog = Blog.new(blog_params)

  end

  def create

    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path
      else
      render :"new"
    end

  end

  def destroy

    @blog.destroy
    redirect_to new_blog_path

  end

  def edit

  end

  def update

    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end

  end



  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
