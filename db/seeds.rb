u = User.create(email: "paw@gmail.com", password: "pass")
UserInfo.create(student_number: "2011-37564", firstname: "Kiel", lastname: "Labian", nickname: "Pawpaw", course: "BS Computer Science", contact_number: "09229365294", user_id: u.id)

u = User.create(email: "arnellebalane@gmail.com", password: "password")
UserInfo.create(student_number: "2011-37575", firstname: "Arnelle", lastname: "Balane", nickname: "Dads", course: "BS Computer Science", contact_number: "09229365294", user_id: u.id)

u = User.create(email: "name3anad@gmail.com", password: "pass")
UserInfo.create(student_number: "2011-37567", firstname: "Emmanuel", lastname: "Lodovice", nickname: "Eman", course: "BS Computer Science", contact_number: "09229365294", user_id: u.id)

EventCategory.create(name: "Event");
EventCategory.create(name: "Holiday");
EventCategory.create(name: "Birthday");