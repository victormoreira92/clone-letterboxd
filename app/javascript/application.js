// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import jQuery  from "jquery"
import * as bootstrap from "bootstrap"
import select2 from 'select2';

window.jquery = jQuery
window.$ = jQuery
select2($);
$('.select2').select2({
  placeholder: "Search all fields...",
  allowClear: true,
  theme: 'bootstrap-5',
  ajax: {
    url: '/search/search_query',
    dataType: 'json',
    delay: 250,
    data: function(params) {
      return {
        query: params.term,
        filter: 'all'
      };
    },
    processResults: function(data, params) {
      params.page = params.page || 1;
      
      // Formata os resultados para incluir os dados necessários
      const formattedData = data.map(item => ({
        id: item.id,
        text: item.title || item.name, // Texto simples para seleção
        title: item.title || item.name,
        poster_path: item.image,
        release_date: item.year,
        detail_url: `/movie/${item.id}`,
        html: `<a href='movie/${item.id}'><div class="d-flex align-items-center">
                <img src="${item.image ? 'https://image.tmdb.org/t/p/original' + item.image : 'https://via.placeholder.com/50'}" 
                     class="me-3" width="30" height="45" style="object-fit: cover;">
                <div>
                  <strong>${item.title } (${item.year ? item.year.split('-')[0] : 'N/A'})</strong>
                </div>
              </div></a>`
      }));
      
      return {
        results: formattedData,
        pagination: {
          more: (params.page * 30) < (data.total_results || 0)
        }
      };
    }
  },
  templateResult: function(repo) {
    if (repo.loading) {
      return repo.text;
    }
    
    if (!repo.id) {
      return $('<div>' + repo.text + '</div>');
    }
    
    return $(repo.html || repo.text);
  },
  templateSelection: function(repo) {
    return repo.text + (repo.year ? ` (${repo.year.split('-')[0]})` : '');
  }
}).on('select2:select', function(e) {
  // Redireciona para a URL do filme quando um item é selecionado
  if (e.params.data.detail_url) {
    window.location.href = e.params.data.detail_url;
  }
});
  $('.search-options').on('click', function(e) {
    e.preventDefault();
    console.log(this.value);  
});

$(document).ready(function() {
  $('#filter').on('click', function() {
    const value = $(this).val();
    const input = $('.select2-selection__placeholder'); // Seleção direta (mais confiável)
    var texto = retornarPlaceholder(value)
    if (input.length) {
      console.log(input)
      input.text(texto); // Exemplo dinâmico
    } else {
      console.error('Input não encontrado!');
    }
  });
});

function retornarPlaceholder(value){ 
  const placeholders = {
    movie: "Search titles...",
    people: "Search people...",
    keywords: "Seach keywords...",
    all: "Search all fields..."
  };
  return placeholders[value]
}

$(document).on('submit', '.button_to', function(e) {
  e.preventDefault();
  const form = $(this);
  const movieId = form.find('button').data('movie-id');
  const button = form.find('button')
  const authenticity_token = form.find('input').val();
  $.ajax({
    url: form.attr('action'),
    type: 'POST',
    dataType: 'json',
    data: { 
      movie: { 
        movie_id: movieId 
      },
      authenticity_token: authenticity_token
    },
    success: function(response) {
      if(response.toogle_movie == 'remove_movie') {
        button.html('Add to Watchlist');
        button.removeClass( "btn-danger" ).addClass( "btn-info" );
      } else {
        button.html('Remove from Watchlist');
        button.removeClass( "btn-info" ).addClass( "btn-danger" );
      }
      showFlashMessage(response.message, response.toogle_movie);
    },
    error: function(xhr) {
      showFlashMessage('Error updating watchlist', 'error');
      console.error('Error:', xhr.responseText);
    }
  });
});

function showFlashMessage(message, type) {
  // Remove mensagens anteriores
  $('.alert').remove();
  
  // Cria a nova mensagem
  const alertClass = type === 'add_movie' ? 'alert-success' : 'alert-danger';
  const flashHtml = `
    <div class="alert ${alertClass} alert-dismissible fade show text-center" role="alert">
      ${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  `;
  
  // Adiciona no topo da página
  const bsAlert = new bootstrap.Alert(flashHtml)
  console.log(flashHtml) ; 
}

$(document).on('submit', '#rate_movie', function(e) {
  e.preventDefault();
  const form = $(this);
  const movie_id = form.find('input#movie_id').val();
  const stars = form.find('input#stars').val();
  const user_id = form.find('input#user_id').val();
  const authenticity_token = form.find('input[name="authenticity_token"]').val();

  $.ajax({
    url: form.attr('action'),
    type: 'POST',
    dataType: 'json',
    data: { 
      rate: { 
        movie_id: movie_id,
        user_id: user_id,
        stars: stars
      },
      authenticity_token: authenticity_token
    },
    success: function(response) {
      console.log(response)
    },
    error: function(xhr) {
      showFlashMessage('Error updating watchlist', 'error');
      console.error('Error:', xhr.responseText);
    }
  });
});
