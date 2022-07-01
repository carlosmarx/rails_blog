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

admin = User.first
user = User.second
elapsed = Benchmark.measure do
  posts = []
  20.times do |x|
    puts "creating post #{x + 1}"
    id = x + 1
    post = Post.new(title: "Title for Post #{id}",
                    body: "Body content #{id} here for post #{id}",
                    user: admin)
    rand(2...5).times do |y|
      puts "creating comment #{y + 1} for post #{id}"
      post.comments.build(body: "Comment #{y + 1} here for post #{y + 1}",
                          user: user)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Time elapsed: #{elapsed.real} seconds"
