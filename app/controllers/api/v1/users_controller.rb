class Api::V1::UsersController < Api::V1::BaseController
URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
skip_before_action :verify_authenticity_token, raise: false
before_action :find_user, only: [:show, :update]

  def index
    @users = User.all
  end

  def show
  end

  def find_user
  end

  def login
    p "======start loggin======"
    mp_openid = wechat_user.fetch('openid')
    p mp_openid

    @user = User.find_or_create_by(mp_openid: mp_openid)

    render json: {
      userId: @user.id,
      currentUser: @user
    }
  end

  def update
  end

  private

  def wechat_user
    wechat_params = {
      appId: Rails.application.credentials.dig[:wx_mp, :app_id],
      secret: Rails.application.credentials.dig[:wx_mp, :app_secret],
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    # p "==========="
    # p @wechat_response.body
    # p "============"
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end
end
