FactoryGirl.define do
  factory 'user/task/comment' do
    content { generate :string }
    user
    after :build do |c|
      c.task = build('user/task')
    end
  end
end
