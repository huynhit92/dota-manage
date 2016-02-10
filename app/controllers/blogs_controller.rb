class BlogsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = @blogs.search(params[:q])
    if(params[:q])
      @blogs = @q.result(distinct: true).page(params[:page])
    else
      @blogs = @blogs.page(params[:page])
    end
    respond_to do |format|
      format.html
      format.json { render :json => @blogs.to_json(Blog.compact_json) }
    end
  end

  def create
    if @blog.save
      render json: @blog.to_json(Blog.compact_json), status: :ok
    else
      render json: @blog.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      render json: @blog.to_json(Blog.compact_json), status: :ok
    else
      render json: @blog.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content, :blog_category_id, :lock_version)
    end
end
