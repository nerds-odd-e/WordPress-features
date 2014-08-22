# encoding: utf-8

class LoginPage < WordPressApp

  def initialize
    super
    if is_login? then
      logout
    end
  end

  def logout
    @login_user = @login_user || User.get_default_account

    sleep 2
    touch_view "我"
    touch_view "我"
    touch_button "编辑"
    touch_view "删除“#{@login_user.host_name}, #{@login_user.host_url}”"
    touch_view "移除"
  end

  def login user=User.get_default_account
    @login_user = user

    add_custom_host @login_user.host_url
    input_username  @login_user.username
    input_password  @login_user.password
    click_login
  end

  def click_login
    touch_view "添加站点"
  end

  def input_username username
    type_text "用户名 / E-mail", username
  end

  def input_password password
    type_text "密码", password
  end

  def add_custom_host url
    touch_view "添加自主托管站点: "
    type_text "站点地址 (URL)", url
  end

  def assert_invalid_password
    there_is "抱歉，登录失败。"
  end
end
