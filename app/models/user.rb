require "rubygems"
require "twitter" #http://rdoc.info/gems/twitter/1.1.2/Twitter

class User
  
  @user 
  
  def initialize(user)
    @user = user
  end
  
  def user()
    return Twitter.user(@user)    
  end  
  
  def user_timeline()
    return Twitter.user_timeline(@user,{:count=>30,:trim_user=>false,:include_rts=>true})
  end
  
  def user_friends() 
    return Twitter.friends(@user).all
  end

  def user_followers()
    return Twitter.followers(@user).all
  end
end