require 'elasticsearch/model'

class User::Task < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :creator, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'
  has_many :comments, :class_name => 'Comment'
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true

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

  def self.search_with_elasticsearch(*args)
    __elasticsearch__.search(*args)
  end
end
