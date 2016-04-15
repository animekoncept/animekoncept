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
  end

  def forum
    @user = User.find params[:user_id]
    @topics = @user.topics
  end

  def events
    #code
  end

  def animelist
    #code
  end

  def friends
    #code
  end
end
