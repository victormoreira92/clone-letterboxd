module TmdbService
  def self.register_service
    Tmdb::Api.key(ENV['SECRET_KEY'])
  end

end