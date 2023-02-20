Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Resources :users, param: :_username
  post 'auth/login', to: 'authentication#authenticate'
  get '/*a', to: 'application#not_found
end

# Path: app/controllers/application_controller.rb
class ApplicationController < ActionController::API

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def not_found
    render json: { error: 'not_found' }
  end
