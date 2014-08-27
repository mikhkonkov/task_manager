class AdminUserEditType < User
  include ApplicationType

  permit :email, :name
end
