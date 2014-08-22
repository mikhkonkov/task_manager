class UserRegistrationType < User
  include ApplicationType

  permit :email, :password, :password_confirmation, :name

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
