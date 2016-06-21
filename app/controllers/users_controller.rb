# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  slug                   :string
#  role_id                :integer
#

class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc")
          .where(owner_id: @user.id, owner_type: "User")
    @microposts = Micropost.where(user_id: current_user.following_users.ids + [current_user.id])
  end

  def forum
    @user = User.find params[:user_id]
    @topics = @user.topics.order("created_at desc")
  end

  def events
    @user = User.find params[:user_id]
    @events = @user.events_marked_as_attending.order("created_at desc")
  end

  def animelist
    #code
  end

  def friends
    #code
  end

  def following
    @user = User.find params[:id]
    current_user.mark_as_following @user

    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def unfollow
    @user = User.find params[:id]
    @user.unmark :following, :by => current_user

    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
