class RatesController < ApplicationController
  before_action :set_rate, only: :update

  def create
    respond_to do |format|
      @rate = Rate.new(rate_params)

      if @rate.save
        flash[:success] = "Movie was rate sucessfull"
        format.html { redirect_to movie_path(params[:rate][:movie_id]) }
      else
        flash[:error] = @rate.error.full_messages
        format.html { redirect_to movie_path(params[:rate][:movie_id])  }
      end
    end
  end

  def update
    respond_to do |format|
      if @rate.update(rate_params)
        flash[:success] = "Movie was updated"
        format.html { redirect_to movie_path(params[:rate][:movie_id]) }
      else
        flash[:error] = @rate.error.full_messages
        format.html { redirect_to movie_path(params[:rate][:movie_id])  }      end
    end
  end

  private

  def set_rate
    @rate = Rate.find(params[:id])
  end


  def rate_params
    params.require(:rate).permit(:movie_id, :user_id, :stars, :spoiler, :review)
  end
end
