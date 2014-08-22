# enconding: UTF-8
Before('@clear-sites') do

end

After('@clear-sites') do
  @login_page = LoginPage.new
end

假如(/^我没有登录$/) do
  @login_page = LoginPage.new
end

假如(/^我使用有效账号登录$/) do
  @login_page ||= LoginPage.new
  @login_page.login User.get_default_account
end

那么(/^我可以登录成功$/) do
  @login_page.assert_is_login
end

假如(/^我使用无效的账号登录$/) do
  @login_page.login User.get("无效账号")
end

那么(/^我的登录会失败$/) do
  @login_page.assert_invalid_password
end
