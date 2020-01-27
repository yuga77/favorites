class ContentsController < ApplicationController
  before_action :set_genre
  
  def index
    @content = Content.new
    @contents = @genre.contents.order("created_at DESC").page(params[:page]).per(9)
  end

  def create
    @content = @genre.contents.new(content_params)
    if @content.save
      redirect_to genre_contents_path(@genre)
    else
      @contents = @genre.contents
      render :index
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  private

  def content_params
    params.require(:content).permit(:title)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
