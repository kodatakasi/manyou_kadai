User.create(
  name: "shibao", 
  email: "shibao@dic.com", 
  password: "shibaodayo", 
  password_confirmation: "shibaodayo"
)

User.create(
  name: "admin_user", 
  email: "admin@dic.com", 
  password: "password", 
  password_confirmation: "password",
  admin: "true"
)