# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create(email: 'carlosmarx27@gmail.com', password: '12345678', confirmation_password: '12345678')

User.create(email: 'admin@mail.com',
            password: '12345678',
            password_confirmation: '12345678',
            name: 'Admin',
            role: User.roles[:admin])

User.create(email: 'user@mail.com',
            password: '12345678',
            password_confirmation: '12345678',
            name: 'User')

10.times do |x|
  puts "creating post #{x + 1}"
  post = Post.create(title: "Title for Post #{x + 1}",
                     body: "Body content #{x + 1} here for post #{x + 1}",
                     user_id: User.first.id)
  5.times do |y|
    puts "creating comment #{y + 1} for post #{x + 1}"
    Comment.create(body: "Comment #{y + 1} here for post #{y + 1}",
                   user_id: User.second.id,
                   post_id: post.id)
  end
end
