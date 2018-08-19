require 'faker'

user = {}
user['password'] = "password"

ActiveRecord::Base.transaction do
    5.times do
      user['firstname'] = ["Natalie","Jason","Jonas","James","Jack"].sample
      user['lastname'] = ["Chin","Kow","Goh","Wong","Lee"].sample
      user['email'] = Faker::Internet.unique.email
      User.create(user)
    end
end

category = {}

ActiveRecord::Base.transaction do
    3.times do
      category['name'] = ["Rails","Ruby","Node.js","React.js","Javascript"].sample
      category['user'] = User.all.sample
      Category.create(category)
    end
end

note = {}

ActiveRecord::Base.transaction do
    13.times do
      note['category'] = Category.all.sample
      note['user'] = User.all.sample
      note['title'] = Faker::HarryPotter.book
      note['description'] = Faker::HarryPotter.quote
      note['code'] = Faker::HarryPotter.quote
      Note.create(note)
    end
end