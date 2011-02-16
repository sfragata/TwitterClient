class TwitterStatisticsController < ApplicationController
  
  def logout
    redirect_to(:action => "index")   
  end
  
  def index
    session[:user] = nil
  end
  
  def find
    begin
      if(session[:user].nil? || session[:user].empty?)
        session[:user]=params[:user]
      end
      if !session[:user].nil? && !session[:user].empty?
        user = User.new(session[:user])
        @user=user.user
        @twitts=user.user_timeline
        respond_to do |format|
          format.html
          format.xml  { render :xml => @user}
        end
      elsif
         redirect_to(:action => "index")
      end
    rescue SocketError => e
       session[:user] = nil
       flash[:erro] = e
       redirect_to(:action => "erro")
    end
    rescue Twitter::NotFound
         flash[:notfound] = session[:user]
         session[:user] = nil
         redirect_to(:action => "notfound")
    end
  
  def followers
    if !session[:user].nil? && !session[:user].empty?
      user = User.new(session[:user])
      @followers=user.user_followers
      respond_to do |format|
        format.html 
        format.xml  { render :xml => @followers}
      end
    elsif
         redirect_to(:action => "index")
    end
  end
  
  def friends
    if !session[:user].nil? && !session[:user].empty?
      user = User.new(session[:user])
      @friends=user.user_friends
      respond_to do |format|
        format.html 
        format.xml  { render :xml => @friends}
      end
    elsif
         redirect_to(:action => "index")
    end
  end
  
  def erro
      respond_to do |format|
        format.html 
      end
  end
  
end