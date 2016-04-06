class WelcomesController < ApplicationController
  def index
  end

  def create
    p '-'*78
    p params[:file]
    p '-'*78
    data = params[:file].read
    p data
    p data.encoding
    p '-'*78
    data.force_encoding(Encoding::CP932)
    p data
    p data.encoding
    p '-'*78
    data.encode!(Encoding::UTF_8)
    p data
    p data.encoding
    p '-'*78
    redirect_to action: :index
  end
end
