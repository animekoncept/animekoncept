class Animelist < ActiveRecord::Base
  belongs_to :user
  belongs_to :anime

  STATUSES = ["Watching", "Plan to Watch", "Completed", "On Hold", "Dropped" ]
  validates :status, inclusion: {in: STATUSES}
end
