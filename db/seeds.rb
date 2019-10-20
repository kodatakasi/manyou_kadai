User.create(
  name: "shibao", 
  email: "shibao@dic.com", 
  password: "shibaodayo", 
  password_confirmation: "shibaodayo"
)
User.create(
  name: "admin", 
  email: "admin@dic.com", 
  password: "passowrd", 
  password_confirmation: "password",
  admin: "true"
)

Label.create(
  title: "仕事"
)
Label.create(
  title: "勉強"
)
Label.create(
  title: "休日"
)
Label.create(
  title: "注意"
)

