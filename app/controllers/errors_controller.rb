class ErrorsController < ApplicationController
  def routing
    respond_to do |format|
      format.html { render inline: '', layout: 'application' }
      format.all { not_found }
    end
  end
end
