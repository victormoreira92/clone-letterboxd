# setup API key
Tmdb::Api.key(ENV['API_KEY'])

# setup default language
Tmdb::Api.language('en')
