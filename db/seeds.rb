#here is where i create seed data to work with test associations

jj = Member.create(email: "jdogg719@aol.com", password: "eminem")
matty = Member.create(email: "jordorocks@aol.com", password: "britney")

Submission.create(category: 1, author: "JJ", email: "jdogg719", date_published: "03/03/1986", title: "2020 Vision", article: "example article yaya", member_id: jj.id )
matty.submissions.create(category: 2, author: "Matty", email: "jordorocks@aol.com", date_published: "07/03/1987", title: "Eat it", article: "example article yaya")
