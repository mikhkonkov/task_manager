class AdminUserEditType < User
  include ApplicationType

  permit :email, :name, :avatar, :avatar_cache
end
