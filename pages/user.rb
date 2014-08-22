# encoding: UTF-8

class User

  def self.get_default_account
    self.get "默认测试帐号"
  end

  def self.get name
    User.new USERS[name]
  end

  def initialize properties
    @properties = properties
  end

  def username
    @properties[:username]
  end

  def password
    @properties[:password]
  end

  def host_url
    @properties[:host_url]
  end

  def host_name
    @properties[:host_name]
  end
end
