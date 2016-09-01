# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:20142024,
              admin: true
  )
User.create!(name:20142037,
              admin: true
  )
User.create!(name:20142009,
              admin: true
  )
User.create!(name:20132031,
              admin: true
  )
User.create!(name:20132024,
              admin: true
  )
User.create!(name:20132026,
              admin: true
  )
User.create!(name:20132023,
              admin: true
  )
User.create!(name:20132005,
              admin: true
  )

a = ["A","B","C","D","E","F","G","H","I"]

9.times do |n|
  Candidate.create!(
      name: "団体班-#{a[n]}",
      money: 0
    )
end

10.times do |n|
  Candidate.create!(
      name: "会社班-#{n+1}",
      money: 0
    ) 
end