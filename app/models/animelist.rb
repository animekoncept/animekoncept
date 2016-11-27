class Animelist < ActiveRecord::Base
  belongs_to :user
  belongs_to :anime

  #STATUSES = ["Watching", "Plan to Watch", "Completed", "On Hold", "Dropped" ]
  #validates :status, inclusion: {in: STATUSES}

  validates :anime, uniqueness: { scope: :user_id, message: "%{attribute} already added" }

  include PublicActivity::Common

end
