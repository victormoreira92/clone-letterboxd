module DashboardHelper

  def url_image(movie)
    movie.poster_path.present? ? "https://image.tmdb.org/t/p/w500/#{movie.poster_path}" : ''
  end
end
