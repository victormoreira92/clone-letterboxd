class SearchController < ApplicationController
  def index
  end

  def search_query
    query = params[:query]
    filter = params[:filter] || 'all' # Filtro padrão

    # Busca na API TMDB
    results = Tmdb::Search.movie(query)

    # Formata a resposta para o Select2
    formatted_results = format_for_select2(results)
    render json: formatted_results
  end

  private

  def get_search_filter(filter)
    # Mapeia filtros para métodos da gem TMDB
    filter_mapping = {
      'all' => :multi,
      'person' => :person,
      'movie' => :movie,
      'keyword' => :keyword
    }

    filter_mapping[filter] || :multi # Fallback para 'multi'
  end

  def format_for_select2(results)
    unless results[:results].blank?
      results[:results].map do |item|
        {
          id: item.id,
          image: item.poster_path,
          year: item.release_date,
          title: item.title # Adapte conforme a estrutura da API TMDB
        }
      end
    end
  end
end
