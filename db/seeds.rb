# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do
#   i = Contact.new(
#   first_name: FFaker::Name.first_name,
#   last_name: FFaker::Name.last_name, 
#   phone_number: FFaker::PhoneNumber.short_phone_number,
#   middle_name: FFaker::Name.first_name,
#   bio: FFaker::Skill.specialty,
#   user_id: rand(1..2))
  
#   i.email = "#{i.first_name}#{i.last_name}@gmail.com"
#   i.save!
# end

# groups = ["family", "enemies", "friends"]

# 3.times do |i|
#   g = Group.new(name: groups[i])
#   g.save
# end

contacts = Contact.all

contacts.each do |contact|
  c = ContactGroup.new(
    contact_id: contact.id,
    group_id: rand(1..3))
  c.save
end
