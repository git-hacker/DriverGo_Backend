class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :destroy, :update]

  def index
    @users = User.all.order(total_distance: :desc)

  end

  def show
  end


  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  def create
    @user = User.new(user_params)
    @user.leaderboard = Leaderboard.first
    if @user.save
      render json: {},status: :created
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:leaderboard_id, :nickname, :avatar_url, :gender,:open_id, :total_distance,:level)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
  end

end
