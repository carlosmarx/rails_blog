puts 'Seeding development database...'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create(email: 'carlosmarx27@gmail.com', password: '12345678', confirmation_password: '12345678')

admin = User.first_or_create(email: 'admin@mail.com',
                             password: '12345678',
                             password_confirmation: '12345678',
                             first_name: 'Admin',
                             last_name: 'Master',
                             role: User.roles[:admin])

user = User.first_or_create(email: 'user@mail.com',
                            password: '12345678',
                            password_confirmation: '12345678',
                            first_name: 'User',
                            last_name: 'Client')

Address.first_or_create(street: 'Rua dos Bobos, 123',
                        city: 'São Paulo',
                        state: 'SP',
                        zip: '01234567',
                        country: 'Brazil',
                        user: admin)

Address.first_or_create(street: 'Rua dos Tolos, 321',
                        city: 'Rio de Janeiro',
                        state: 'RJ',
                        zip: '12345678',
                        country: 'Brazil',
                        user: user)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
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

puts "Seeded development DB in #{elapsed.real} seconds"
