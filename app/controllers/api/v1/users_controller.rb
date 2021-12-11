class Api::V1::ServicesController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:create], raise: false
  skip_before_action :verify_authenticity_token

  def create
    user = get_user

    if user.blank?
      render_error(user)
    end
      render json: {
        user: user,
        headers: {
          "X-USER-EMAIL" => user.email,
          "X-USER-TOKEN" => user.authentication_token
        }
      }
    end
  end

  private
  def get_user
    mp_openid = fetch_wx_open_id(params[:code])["mp_openid"]
    user = User.find_by(mp_openid: mp_openid)
    return nil if user.blank?

    if user.blank?
      user = User.create!(
        mp_openid: mp_openid,
        email: "#{mp_openid.downcase}_#{SercureRandom.hex(3)}@wx.com",
        password: Devise.friendly_token(20)
      )
    end
    return user
  end

  def fetch_wx_open_id(code)
    app_id = Rails.application.credentials.dig( :wechat, :app_id )
    app_secret = Rails.application.credentials.dig( :wechat, :app_secret)
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient.get(url)
    JSON.parse(response.body)
  end

  def render_error(object)
    render json: { status: 'fail', res: 'fail', errors: object.errors.full_messages },
  status: 422
  end
