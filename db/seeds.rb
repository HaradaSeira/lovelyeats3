user = User.first

Shop.create!(
  name: "Sample Shop 1",
  description: "This is a sample shop 1.",
  user: user
)

Shop.create!(
  name: "Sample Shop 2",
  description: "This is a sample shop 2.",
  user: user
)