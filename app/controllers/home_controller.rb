class HomeController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @events = Event.most_hit(5.day.ago, 4)
    @users = User.all_except(current_user)
    @topics = Topic.most_hit(5.day.ago, 10)
    @micropost = Micropost.new
    @microposts = Micropost.where(user_id: current_user.following_users.ids + [current_user.id])
  end
end
