class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  belongs_to :project, optional: true 

  enum status: {todo: 0, in_progress: 1, done: 2}

  validates :title, :coins, presence: true
  validate :user_must_exist 

  private

  def user_must_exist
    return if user_id.blank?
    return if User.exists?(user_id)

    errors.add(:user_id, "must exist")  
  end
end