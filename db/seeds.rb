User.create(
  name: "shibao", 
  email: "shibao@dic.com", 
  password: "shibaodayo", 
)
User.create(
  name: "admin", 
  email: "admin@dic.com", 
  password: "password", 
  admin: "true",
)
User.create(
  name: "test_user", 
  email: "test@dic.com", 
  password: "password", 
)

User.create(
  name: "test_user2", 
  email: "test02@dic.com", 
  password: "password", 
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
