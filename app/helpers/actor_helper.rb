module ActorHelper
  def actor_image(actor)
    actor.profile_path.present? ? "https://image.tmdb.org/t/p/w500/#{actor.profile_path}" : ''
  end
end
