class ApplicationController < ActionController::Base
  rescue_from ActionController::UnknownFormat, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render inline: '', layout: 'application'
  end

  protected

  def not_found
    render json: {status: :error, messages: ['Not Found']}, status: 404
  end
end
