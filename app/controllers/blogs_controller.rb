class BlogsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = @blogs.search(params[:q])
    if(params[:q])
      @blogs = @q.result(distinct: true).page(params[:page])
    else
      @blogs = @blogs.page(params[:page])
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content, :lock_version)
    end
end
