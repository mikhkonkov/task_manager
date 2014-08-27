class User::Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'

  state_machine initial: :opened do
    state :opened
    state :closed

    event :open do
      transition [:closed] => :opened
    end

    event :close do
      transition [:opened] => :closed
    end
  end
end
