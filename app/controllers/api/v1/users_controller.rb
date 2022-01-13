class Api::V1::UsersController < Api::V1::BaseController
  URL= "https://api.weixin.qq.com/sns/jscode2session".freeze
  skip_before_action :verify_authenticity_token, raise: false
  before_action :find_user, only: [:show, :update]

  def index
    @users = User.all
  end

  def show
  end

  def find_user
    @user = User.find(params[:id])
  end

  def login
    p "=========start logging========"
    mp_openid  = wechat_user.fetch('openid')
    p mp_openid

    @user = User.find_or_create_by(mp_openid: mp_openid)
    render json: {
      userId: @user.id,
      currentUser: @user
    }
  end

  def update
    # @user.update(permitted_params)
    p "========123======"
    p @user
    p "================="
    if params[:userInfo]
      user_info = params[:userInfo]
      @user.user_name = user_info[:nickName]
      @user.gender = user_info[:gender].to_s
      @user.avatar = user_info[:avatarUrl]
      @user.save!
      render json: { currentUser: @user }
   else
      user_info = params[:user]
      p user_info[:phone_number]
      @user.phone_number = user_info[:phone_number].to_i
      @user.save!
      render json: { currentUser: @user }
   end
  end

  private

  def wechat_user
    wechat_params = {
      appId: Rails.application.credentials.dig(:wx_mp, :app_id),
      secret: Rails.application.credentials.dig(:wx_mp, :app_secret),
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end
end
