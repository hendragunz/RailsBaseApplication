RailsBaseApplication::Application.routes.draw do
  resources :oauth_clients

  match '/oauth/test_request',  :to => 'oauth#test_request',  :as => :test_request
  match '/oauth/token',         :to => 'oauth#token',         :as => :token
  match '/oauth/access_token',  :to => 'oauth#access_token',  :as => :access_token
  match '/oauth/request_token', :to => 'oauth#request_token', :as => :request_token
  match '/oauth/authorize',     :to => 'oauth#authorize',     :as => :authorize
  match '/oauth',               :to => 'oauth#index',         :as => :oauth

  devise_for :users

  scope '/user', :as => 'user' do
    scope :module => 'private' do
      resources :bitmarks
    end
  end

  resources :short_urls, :only => [:new, :create] do
    # TO DO
  end
  match '/short_urls' => redirect('/')



  # root path application
  root :to => 'home#show'

  # get '/:slug', :to => 'urls#show', :as => 'url'
  constraints DomainConstraint.new('st.pt') do
    match "/:slug", :to => 'marked_urls#show'
  end
end
