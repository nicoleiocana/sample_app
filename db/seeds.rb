User.create!(name: "Example User", 
             email: "example@railstutorial.org", 
             password: "foobar", 
             password_confirmation: "foobar", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)
             
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, 
               email: email, 
               password: password, 
               password_confirmation: password, 
               activated: true, 
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

list = %w[happy sad angry fun dope humble chill wack nice evil rad puppy]
list.each { |elem| Tag.create(name: elem) }
microposts = Micropost.first(100)
10.times do
  microposts.each do |post|
    rand_tag = Tag.order(Arel.sql('random()')).first
    if post.tag_list.delete(' ').split(',').include?(rand_tag.name)
      next
    else
      new_tagging = post.taggings.build(tag_id: rand_tag.id)
      new_tagging.save if new_tagging.valid?
    end
  end
end