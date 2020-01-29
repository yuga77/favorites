class DetailsController < ApplicationController
  before_action :set_genre
  before_action :set_content

  
  def index
    @detail = Detail.new
    @details = @content.details.includes(:genre, :content).order("created_at DESC").page(params[:page]).per(12)
  end

  def create
    @detail = @content.details.new(detail_params)
    puts
    puts
    puts @detail.detail
    puts @detail.content.id
    puts @detail.text
    puts @detail.valid?
    puts @detail.errors.full_messages
    puts

    if @detail.save
      redirect_to  genre_content_details_path(@genre,@content)
    else
      @details = @content.details
      render :index
    end
  end

  def destroy
    detail = Detail.find(params[:id])
    detail.destroy
    redirect_to  genre_content_details_path(@genre,@content)
  end

  private

  def detail_params
    params.require(:detail).permit(:detail, :image, :text).merge(genre_id: @genre.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def set_content
    @content = Content.find(params[:content_id])
  end
end
