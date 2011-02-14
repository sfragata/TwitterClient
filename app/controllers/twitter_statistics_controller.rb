require "rubygems"
require "twitter" #http://rdoc.info/gems/twitter/1.1.2/Twitter

class TwitterStatisticsController < ApplicationController
  
  def logout
    redirect_to(:action => "index")   
  end
  
  def index
    session[:user] = nil
  end
  
  def find
    begin
      if(session[:user] == nil || session[:user].empty?)
        puts "sessao nula para a tag :user"
        session[:user]=params[:user]
      end
      if session[:user] != nil && !session[:user].empty?
        @user=Twitter.user(session[:user])
        @twitts=Twitter.user_timeline(session[:user],{:count=>30,:trim_user=>true,:include_rts=>true})
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @user}
        end
      elsif
         redirect_to(:action => "index")
      end
    rescue SocketError => e
      render :text => "Error: #{e}"
    end
    rescue Twitter::NotFound => t
         flash[:notfound] = "Usuario #{session[:user]} nao encontrado "
         session[:user] = nil
         redirect_to(:action => "notfound")
    end
  
  def followers
    puts "user: #{session[:user]}"
    if session[:user] != nil && !session[:user].empty?
      @followers=Twitter.followers(session[:user]).users
      respond_to do |format|
        format.html 
        format.xml  { render :xml => @followers}
      end
    elsif
         redirect_to(:action => "index")
    end
  end
  
  def friends
    if session[:user] != nil && !session[:user].empty?
      @friends=Twitter.friends(session[:user]).users
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