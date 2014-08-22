class UserLoginType
  include ApplicationControllerWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate, if: :email

  def user
    ::User.where(email: email.mb_chars.downcase).first
  end

end
