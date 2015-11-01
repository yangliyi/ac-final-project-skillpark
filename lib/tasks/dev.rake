
  task :regenerate_user_token => :environment do
    User.all.each do |u|
      puts "User: #{u.id}"
      u.authentication_token = Devise.friendly_token
      u.save
    end
  end