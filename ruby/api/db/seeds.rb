gb = User.create!(login: "gburanov", password: "12345678", role: "user")
guest = User.create!(login: "guest", password: "guest")
User.create!(login: "admin", password: "admin", role: "admin")

pushkin = Author.create!(creator: guest, name: "Pushkin", biography: "Russian superstar")
kerouac = Author.create!(creator: gb, name: "Jack Kerouac", biography: "First US hippie")

Book.create!(creator: guest, author: pushkin, name: "Babushka firytailes", about: "Russian fairytailes")
Book.create!(creator: gb, author: pushkin, name: "Ruslan and Ludmila", about: "Epic fairytale")

Book.create!(creator: gb, author: kerouac, name: "On the road")
