class Api::V1::ServiceController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:create], raise:false
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
#   URL = 'https://api.weixin.qq.com/sns/jscode2session'
#   def login
#     wx_params = {
#       appid: Rails.application.credentials.dig(wx_mp, :app_id)
#       secret: Rails.application.credentials.dig(wx_mp, :app_secret)
#       js_code: params[:code]
#       grant_type:"au
#       thorization_code"
#     }

#     response = RestClient.get(URL, wx_params)
#     user_info = JSON.parse(response)
#     mp_openid = user_info['openid']
#     @user = User.find_by(mp_openid: mp_openid)
#     @user = User.create(mp_openid: mp_openid, email: "#{SecureRandom.hex(8)}@mail.com", password: 'password') if @user.blank?
#   end
# end
