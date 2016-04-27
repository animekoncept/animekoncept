class HomeController < ApplicationController

  def show
    @user = current_user
    @events = Event.most_hit(5.day.ago, 4)
    @users = User.all
    @topics = Topic.most_hit(5.day.ago, 10)
    @micropost = Micropost.new
    @microposts = @user.microposts
  end
end
