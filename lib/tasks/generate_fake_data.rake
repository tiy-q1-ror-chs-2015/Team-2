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

  end

end
