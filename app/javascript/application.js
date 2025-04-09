// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import jQuery  from "jquery"
import * as bootstrap from "bootstrap"

window.jquery = jQuery
window.$ = jQuery

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
