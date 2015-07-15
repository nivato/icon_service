class ImagesController < ApplicationController

  def index
    render json: {status: :ok, data: Image.all}, status: :ok
  end

  def create
    @image = Image.new(image_params)
    @image.host = "#{request.protocol}#{request.host}:#{request.port}"
    if @image.save
      render json: {status: :ok, data: 'You have successfully called POST images.json.'}, status: :ok
    else
      render json: {status: :error, messages: ['Oopsie! Something went wrong!', @image.processing_error]}, status: :bad_request
    end
  end

  private

  def image_params
    params.require(:image).permit(:name, :origin_url)
  end

end
