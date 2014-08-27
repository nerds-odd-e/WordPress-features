# enconding: UTF-8
Before('@logout') do

end

After('@logout') do
  @login_page = LoginPage.new
end

假如(/^(?:我)?没有登录$/) do
  @login_page = LoginPage.new
end

假如(/^(?:我)?使用有效(?:的)?账号登录$/) do
  @login_page ||= LoginPage.new
  @login_page.login User.get_default_account
end

那么(/^(?:我)?(?:可以|能够)(?:登录成功|成功登录)$/) do
  @login_page.assert_is_login
end

假如(/^(?:我)?使用无效(?:的)?账号登录$/) do
  @login_page ||= LoginPage.new
  @login_page.login User.get("无效账号")
end

那么(/^(?:我)?(?:的登录会失败|登录会失败|会看到登录失败的消息)$/) do
  @login_page.assert_invalid_password
end
