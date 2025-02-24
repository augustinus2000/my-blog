User.create(email: 'example@example.com', password: 'password', password_confirmation: 'password')

2.times do |i|
  Post.create(title: "Title #{i}", body: "Body #{i} words goes here idk...", user_id: User.first.id)
end