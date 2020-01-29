class DetailsController < ApplicationController
  before_action :set_genre
  before_action :set_content

  
  def index
    @detail = Detail.new
    @details = @content.details.includes(:genre, :content).order("created_at DESC").page(params[:page]).per(12)
  end

  def create
    @detail = @content.details.new(detail_params)
    if @detail.save
      respond_to do |format|
        format.html {redirect_to  genre_content_details_path(@genre,@content)}
        format.json
      end
    else
      @details = @content.details.includes(:genre, :content)
      flash.now[:alert] = '詳細を入力してください。'
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
    params.require(:detail).permit(:detail, :image, :text).merge(genre_id: @genre.id, content_id: @content.id, user_id: current_user.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def set_content
    @content = Content.find(params[:content_id])
  end
end
