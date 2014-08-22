# encoding: UTF-8

class WordPressApp

  def initialize
    go_back_to_homepage
  end

  def start_app

  end

  def is_login?
    not is_view_exist "登录"
  end

  def can_go_back?
    is_view_exist "返回"
  end

  def go_back
    touch_view "返回"
    step_pause
  end

  def go_back_to_homepage
    while can_go_back?
      go_back
    end
  end

  def assert_is_login
    there_is "我"
  end

end
