# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(
  title: "Ruby Learnin's",
  description:
    %{<p>
        Ruby is good stuff. It does fun things, and sometimes
        I even think that it know's voodoo magic.
        Magic is great.
      </p>},
  image_url: 'ruby.png',
  price: 49.95
)

Product.create!(
  title: 'Camus - The Stranger',
  description: %{<p>
    A foundational existential text, and one of my personal favorite
    books.</p>},
  image_url: 'stranger.jpg',
  price: 9.99
)


Product.create!(
  title: 'Steven Neuhaus',
  description: %{<p>
    He's great, but still trying to figure out his life.</p>},
  image_url: 'steven_rails.jpg',
  price: 9000000
)
