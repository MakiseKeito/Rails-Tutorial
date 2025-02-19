# Example Userという名前のユーザーをつくる（seedsを実行したときにこのユーザーでログインして一覧ページを見るため？）
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
# create!はユーザーが無効な場合にfalseを返すのではなく、例外を発生させる。


# 99人のダミーユーザーをつくる
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end



# サンプルデータにマイクロポストを追加する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end



# サンプルデータにfollowing/followerの関係性を追加する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
# 最初のユーザーがユーザーID3~51のユーザーをフォローする
followers.each { |follower| follower.follow(user) }
# ユーザーID4~41のユーザーが最初のユーザーをフォローする