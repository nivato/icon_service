class ImagesController < ApplicationController

  def index
    render json: {status: :ok, data: 'You have successfully called GET images.json.'}, status: :ok
  end

  def create
    render json: {status: :ok, data: 'You have successfully called POST images.json.'}, status: :ok
  end

end
