class ContentsController < ApplicationController
  before_action :set_genre
  
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:genre).order("created_at DESC").page(params[:page]).per(9)
  end

  def create
    @content = @genre.contents.new(content_params)
    if @content.save
      respond_to do |format|
        format.html { redirect_to genre_contents_path(@genre,@content)}
        format.json { render json: @content}
      end
    else
      @contents = @genre.contents.includes(:genre)
      flash.now[:alert] = 'タイトルを入力してください。'
      render :index
    end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to genre_contents_path(@genre,@content)
  end
  
  def show
    @content = Content.find(params[:id])
  end

  private

  def content_params
    params.require(:content).permit(:title).merge(user_id: current_user.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
