u = User.create(email: "paw@gmail.com", password: "pass")
UserInfo.create(student_number: "2011-37564", firstname: "Kiel", lastname: "Labian", course: "BS Computer Science", user_id: u.id)

u = User.create(email: "arnellebalane@gmail.com", password: "password")
UserInfo.create(student_number: "2011-37575", firstname: "Arnelle", lastname: "Balane", course: "BS Computer Science", user_id: u.id)

u = User.create(email: "name3anad@gmail.com", password: "pass")
UserInfo.create(student_number: "2011-37567", firstname: "Emmanuel", lastname: "Lodovice", course: "BS Computer Science", user_id: u.id)