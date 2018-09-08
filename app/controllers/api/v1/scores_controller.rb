class Api::V1::ScoresController < Api::V1::BaseController
    def create

  puts "create new score"
  puts params

  @score = Score.new()
  puts @score.inspect
  @score.score = params[:score]
  puts @score.inspect
  @score.user = User.find(params[:user_id])
    if @score.save
      render json: {}, status: :created
    else
      render_error
    end
  end

  def index
    @scores = Score.order('score DESC').where(user_id: params[:user_id]).limit(10)
  end

  def highest
    @scores = Score.order('score DESC').where(user_id: params[:user_id]).limit(1)
  end

private

  def scores_param
    params.require(:score).permit(:score)
  end

  def render_error
    render json: { errors: @score.errors.full_messages },
      status: :unprocessable_entity
  end
end
