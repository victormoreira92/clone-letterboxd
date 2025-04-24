module HomeHelper
  def home_image_back(movie)
    movie.backdrop_path.present? ? "https://image.tmdb.org/t/p/original#{movie.backdrop_path}" : 'placeholder.jpg'
  end
end
