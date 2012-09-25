class Private::BitmarksController < Private::ModuleController
  # GET -
  def index
    @bitmarks = current_user.urls
  end

  def create
    @url = current_user.urls.new filtered_params
    if @url.save
      @url.reload
    end
  end

  private

    def filtered_params
      params[:url].slice(:url, :public)
    end


end
