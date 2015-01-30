namespace :db do
  task :generate_fake_data => :environment do
    N = 100
    # generate a bunch of users
    puts 'Generating user names'
    N.times do
      # generate new user
      u = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",   # use password for all users during dev
      )
      # associate an avatar with a new user
      u.avatar = Avatar.new(
        src: Faker::Avatar.image
      )
      # save new user to the db
      u.save
    end
    # generate 20 posts for each user
    puts 'Generating posts'
    User.all.each do |u|
      20.times do
        new_post = Post.new( content: Faker::Lorem.paragraph )
        u.posts.push( new_post )
      end
    end
    # generate 2 comments for each post
    puts 'Generating comments for posts'
    Post.all.each do |p|
      2.times do
        new_comment = Comment.new( content: Faker::Lorem.paragraph)
        p.comments.push( new_comment )
      end
    end
  end

  task :initialize => :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["db:generate_fake_data"].execute
  end
end
