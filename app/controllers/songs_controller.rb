class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if  @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def show
    end

    def edit 
    end

    def update
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path(@songs)
    end

    private

    def song_params
        params.require(:song).permit(:title, :release_year, :released, :artist_name, :genre)
    end

    def find_song
        @song = Song.find_by_id(params[:id])
    end

end
