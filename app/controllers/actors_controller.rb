class ActorsController < ApplicationController


  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find params[:id]
    @movies = @actor.movies
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new actor_params
    if @actor.save
      redirect_to @actor
    else
      render :new
    end
  end

  def update
    @actor = Actor.find params[:id]
    movie = Movie.find actor_params[:movies]
    @actor.movies << movie
    @actor.name = actor_params[:name]
    if @actor.save
      redirect_to @actor
    else
      render :edit
    end
  end

  def destroy
    Actor.find(params[:id]).destroy
  end

  def remove_movie
    @actor = Actor.find(params[:id])
    @movie = Movie.find params[:movie_id]
    @actor.movies.delete(@movie)
    @actor.save
    redirect_to actor_path
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :movies)
  end
end
