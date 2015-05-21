# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BodyPart.create([{name: "head"}, {name: "neck"},
  {name: "knees"},
  {name: "ankles"},
  {name: "shins"},
  {name: "quadriceps"},
  {name: "calves"},
  {name: "hips"},
  #{name: "rear"},
  {name: "hamstring"},
  {name: "spine"},
  {name: "shoulders"},
  {name: "back"},
  {name: "stomach"},
  {name: "arms"}
])
