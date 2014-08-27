class UserRegistrationType < User
  include ApplicationType

  validates :password, presence: true, length: { minimum: 6 }

  permit :email, :password, :password_confirmation, :name

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
