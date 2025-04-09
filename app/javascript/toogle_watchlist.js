window.jquery = jQuery
window.$ = jQuery

$(document).ready(function() {
  console.log('casa')
  // Seleciona o formulário com classe "button_to" que contém um input com name="movie[movie_id]"
  $('.toogle_watchlist').on('click', function(e) {
    e.preventDefault(); // Evita o envio tradicional do formulário
    console.log('Formulário capturado!');
    
    // Aqui você pode acessar:
    const form = $(this);
    const movieId = form.find('input[name="movie[movie_id]"]').val();
    const token = form.find('input[name="authenticity_token"]').val();
    
    console.log('Movie ID:', movieId);
    console.log('CSRF Token:', token);
  });
});