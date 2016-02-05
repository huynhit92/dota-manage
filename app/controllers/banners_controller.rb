class BannersController < ApplicationController
  load_and_authorize_resource

  def index
    Rails.logger.debug("index")
  end

  def create
    if @banner.save
      render json: @banner.to_json(Banner.compact_json), status: :ok
    else
      render json: @banner.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @banner.update(banner_params)
      render json: @banner.to_json(Banner.compact_json), status: :ok
    else
      render json: @banner.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def banner_params
      params.require(:banner).permit(:blog_id, :blog_pr_text, :lp_url, :image, :start_date, :end_date, :lock_version)
    end

end
