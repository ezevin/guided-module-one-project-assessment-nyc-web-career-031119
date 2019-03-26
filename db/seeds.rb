# USERS
bob = User.find_or_create_by(name: "Bob")
jim = User.find_or_create_by(name: "Jim")
sally = User.find_or_create_by(name: "Sally")
abby = User.find_or_create_by(name: "Abby")
dan = User.find_or_create_by(name: "Dan")

# MYTHS

pegasus = Myth.find_or_create_by(name: "Pegasus", location: "Sky", origin_country: "Greece", facts: "born from the mixture of sea foam, pain and Medusa’s blood", has_tail: true, has_wings: true)

sirens = Myth.find_or_create_by(name: "Sirens", location: "Sea", origin_country: "Greece", facts: "legendary sea-nymphs who lured sailors passing nearby to death with their beautiful voices and enchanting songs.", has_tail: true, has_wings: false)

sphinx_greece = Myth.find_or_create_by(name: "Sphinx", location: "Land", origin_country: "Greece", facts: "the Greek sphinx had a lion’s body, a woman’s head and an eagle’s chest and wings (and the tail of a serpent in some versions of the accounts), and was a merciless and treacherous creature.", has_tail: true, has_wings: true)

sphinx_egyption = Myth.find_or_create_by(name: "Sphinx", location: "Land", origin_country: "Egypt", facts: "the Greek sphinx had a lion’s body, a man’s head and an eagle’s chest and wings (and the tail of a serpent in some versions of the accounts), and was a benevolent figure.", has_tail: true, has_wings: true)

centaur = Myth.find_or_create_by(name: "Centaur", location: "Land", origin_country: "Greece", facts: " the torso and head of a human being and the body of a horse.", has_tail: true, has_wings: false)

# USER-MYTHS

 um1 = UserMyth.find_or_create_by(user_id: 1, myth_id:1, rating: 3.5)

 um2 = UserMyth.find_or_create_by(user_id: 2, myth_id:1, rating: 2.0)

 um3 = UserMyth.find_or_create_by(user_id: 1, myth_id:3, rating: 4.6)

 um4 = UserMyth.find_or_create_by(user_id: 4, myth_id:4, rating: 2.4)

 um5 = UserMyth.find_or_create_by(user_id: 3, myth_id:5, rating: 5.0)
