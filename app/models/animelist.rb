class Animelist < ActiveRecord::Base
  belongs_to :user
  belongs_to :anime

  STATUSES = ["Watching", "Plan to Watch", "Completed", "On Hold", "Dropped" ]
  validates :status, inclusion: {in: STATUSES}

  validate :rating_is_valid
  def rating_is_valid
    if self.rating && (self.rating <= 0 || self.rating > 5 || (self.rating * 2) % 1 != 0)
      errors.add(:rating, "is not in the valid range")
    end
  end
end
