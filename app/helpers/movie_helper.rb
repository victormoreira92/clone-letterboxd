module MovieHelper
  def url_image_back(movie)
    movie.backdrop_path.present? ? "https://image.tmdb.org/t/p/original#{movie.backdrop_path}" : 'placeholder.jpg'
  end

  def watchlist_includes_movie?(movie_id)
    current_user.watchlist.movies.where(movie_id: movie_id).exists? ? 'Remove Movie of WatchList' : 'Add movie of WatchList'
  end
end
