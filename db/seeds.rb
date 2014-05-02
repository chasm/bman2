User.destroy_all

User.create( email: "bobs@youruncle.com", born_on: Date.today - 1.day )
