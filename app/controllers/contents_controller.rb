class ContentsController < ApplicationController
  before_action :set_genre
  
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
  end

  def create
    @content = @genre.contents.new(content_params)
    if @content.save
      redirect_to genres_contents_path(@genre)
    else
      @contents = @genre.contents.includes(:user)
      render :index
    end
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
