class BannersController < ApplicationController
  load_and_authorize_resource

  def index
    Rails.logger.debug("index")
  end

end
