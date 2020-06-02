class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index 
      @songs = Song.all
  end

  def show 
  end

  def new 
      @song = Song.new
  end 

  def create 
      @song = Song.new(get_params)
      if @song.save
          redirect_to song_path(@song)
      else 
          render :new 
      end
  end

  def edit 
  end

  def update
      @song.update(get_params) 
      if @song.save
          redirect_to song_path(@song)
      else 
          render :edit 
      end
  end 

  def destroy 
      @song.destroy 
      redirect_to songs_path
  end

  private 
  def set_song
      @song = Song.find_by_id(params[:id])
  end

  def get_params 
      params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
  end
end