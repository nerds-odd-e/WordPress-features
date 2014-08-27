# encoding: utf-8
# language: zh-CN

##############################
When /^我打开了应用$/ do

end

When /^我等待标签栏的出现$/ do
  wait_for(WAIT_TIMEOUT) {
    query("tabBarButton").count > 0
  }
end

When /^(?:我)?等待$/ do
  sleep 2
end

When /^我等啊等$/ do
  sleep 4
end

When /^我等啊等啊等$/ do
  sleep 10
end

When /^(?:我)?(?:触摸|点击)"([^\"]*)"$/ do |name|
  touch_view name
end

When /^我(?:触摸|点击)第(\d+)个"([^\"]*)"$/ do |index,name|
    touch_view(name, index)
end

When /^我(?:触摸|点击)警告框中的"([^\"]*)"$/ do |name|
    touch_alert_button name
end

When /^我(?:触摸|点击)标签栏"([^\"]*)"$/ do |name|
  touch_tab_bar_button name
end

When /^我(?:触摸|点击)按钮"([^\"]*)"$/ do |name|
  touch_button name
end

When /^(?:我)?在"([^\"]*)"中输入(?:了)?"([^\"]*)"$/ do |field_name, text_to_type|
  type_text_in "view marked:'#{field_name}'", text_to_type
end

When /^我在输入视图"([^\"]*)"中输入了"([^\"]*)"$/ do |field_name, text_to_type|
    type_textView field_name, text_to_type
end

When /^我清空了"([^\"]*)"$/ do |field_name|
  clear_text_field field_name
end

When /^我向(上|下|左|右)滑动屏幕$/ do |direction|
  scroll_default_view direction
end

When /^我返回到上一级界面$/ do
    touch("navigationItemButtonView first")
    sleep(STEP_PAUSE)
end

When /^我搜索"([^\"]*)"$/ do |search_text|
    touch("searchBar index:0")
    wait_for_keyboard()
    keyboard_enter_text search_text
    uia_enter
    sleep(STEP_PAUSE)
end

##############################
# Then

Then /^(?:我)?(?:会|可以|能|能够)看(?:到|见)"([^\"]*)"$/ do |expected_mark|
  there_is expected_mark
end

# /Then
##############################
