class DetailsController < ApplicationController
  before_action :set_genre
  before_action :set_content

  
  def index
    @detail = Detail.new
    @details = @content.details
  end

  def create
    @detail = @content.details.new(detail_params)
    if @detail.save
      redirect_to  genre_content_details_path(@genre,@content)
    else
      @detail = @content.details
      render :index
    end
  end

  private

  def detail_params
    params.require(:detail).permit(accepts_nested_attributes_for: [:detail, :image, :text])
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def set_content
    @content = Content.find(params[:content_id])
  end
end
