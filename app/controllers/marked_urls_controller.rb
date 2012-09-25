class MarkedUrlsController < ApplicationController
  # GET -
  def show
    @bitmark = Url.where(token: params[:slug]).first

    if @bitmark.present?
      @bitmark.hit!
      redirect_to @bitmark.url
    else
      flash[:error] = 'The link you request is not found'
      redirect_to root_path
    end
  end
end
