class LoginController < ApplicationController
URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


def wechat_params

    { appid: "wx7b85d2d1429da2c6",
    secret: "3be7b25d2eaf5454db4d44d7878e1571",
    js_code: params[:code],
    grant_type: "authorization_code" }

end

def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||=JSON.parse(@wechat_response.body)
  end

  def login
    p wechat_user.fetch("openid")
    @user = User.find_or_initialize_by(open_id: wechat_user.fetch("openid"))
    @user.leaderboard = Leaderboard.first
    @user.save
    render json: {
      userId: @user.id
    }
  end
end
