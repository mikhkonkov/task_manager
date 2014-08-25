class TaskCreateType < Task
  include ApplicationType

  validates :title, presence: true
  validates :discription, presence: true
  validates :state, presence: true
  validates :user_id, presence: true

  permit :title, :discription, :state, :user_id
end
