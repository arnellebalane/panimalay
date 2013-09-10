# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create(email: "paw@gmail.com", password: "pass")
UserInfo.create(student_number: "2011-37564", firstname: "Kiel", lastname: "Labian", course: "BS Computer Science", user_id: u.id)