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
  post = Post.create(title: "Title for Post #{x}",
                     body: "Body content #{x} here for post #{x}",
                     user_id: User.first.id)
  5.times do |_y|
    Comment.create(body: "Comment #{x} here for post #{x}",
                   user_id: User.second.id,
                   post_id: post.id)
  end
end
