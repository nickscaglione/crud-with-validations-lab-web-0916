class SongsController< ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save

      redirect_to @song
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    if @song.valid?
      @song.save

      redirect_to @song
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:released, :release_year, :artist_name, :title, :genre)
  end

end
