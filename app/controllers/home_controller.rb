class HomeController < ApplicationController
  def show
    @url = Url.new
  end
end
