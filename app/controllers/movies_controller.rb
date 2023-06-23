class MoviesController < ApplicationController
  def create
    movie = Movie.create!(movie_params)
    render json: movie, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end
  
  def index
    movies = Movie.all
    render json: movies
  end
  def update
     movie=Movie.find_by(id: params[:id])
     if movie
      movie.update(movie_params) 
      render json: movie
     else
      render json: {error: "Bird not found"},status: :not_found
     end
  end
  # def destroy
  #   movie
  # end

  def increment_likes
    movie= movie.find_by(id: params[:id])
    if movie
      movie.update(likes: movie.likes+1)
    else
      render json: {error: "Movie not found"}
    end


  private
  def movie_params
    params.permit(:title, :likes, :director, :year, :length, :description, :poster_url, :category, :discount, :female_director)
  end

end
