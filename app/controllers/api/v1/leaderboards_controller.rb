class Api::V1::LeaderboardsController < Api::V1::BaseController
  before_action :set_loveline, only: [:destroy]
  def index
    @leaderboards = Leaderboard.all.order('created_at DESC')
  end

  def create
    @leaderboard = Leaderboard.new()
    if @leaderboard.save
      render :index
    else
      render_error
    end
  end


  def destroy
    @leaderboard.destroy
    head :no_content
  end



  private
  def render_error
    render json: { errors: @leaderboard.errors.full_messages },status: :unprocessable_entity
  end

  def set_loveline
    @leaderboard = Leaderboard.find(params[:id])
  end

end
