class Api::ModuleController < ApplicationController
  respond_to :json
  before_filter :oauth_required

  before_filter :prepare_pagination

  def current_user=(user)
    sign_in user
  end

  def prepare_pagination
    @page   = (params[:page] || 1).to_i
    @limit  = (params[:limit] || 25).to_i
    @sort   = params[:sort]
    ap "====================="
    ap params
    ap "====================="

  end


end
