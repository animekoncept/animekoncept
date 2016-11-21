class HomeController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @events = Event.most_hit(5.day.ago, 4)
    @users = User.all_except(current_user.users_marked_as_following + [current_user] )
    #@users = User.marked_as_following
    @topics = Topic.most_hit(5.day.ago, 10)
    #@micropost = Micropost.new
    @new_comment = Comment.build_from(@user, current_user.id, "") if user_signed_in?
    @comment = Comment.where(user_id: current_user.following_users.ids + [current_user.id])
    @comments = @comment.order("created_at desc")
  end
end
