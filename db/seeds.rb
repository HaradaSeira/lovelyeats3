user = User.first

user = User.find_by(email: 'user1@user.com.jp')

# Shopのサンプルデータを生成
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

# eventのサンプルデータを生成
require 'faker'

5.times do
  Event.create!(
    opened_at: Time.now,
    closed_at: Time.now + 3.hours,
    shop_id: Shop.first.id,
    location_id: Location.first.id,
    address: '12345 Example Street'  # ここを適切な文字列に置き換えてください
  )
end

