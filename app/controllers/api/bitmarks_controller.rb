class Api::BitmarksController < Api::ModuleController
  # GET -
  def index
    @bitmarks = current_user.urls
  end
end
