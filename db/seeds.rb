# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [name: 'Some awesome person']
users.each do |u|
  User.create!(u)
end

posts = [{title: 'This is a story about how my life got flipped-turned upsode down', contents: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum fringilla aliquet. Aliquam consequat ut sem eget egestas. Nunc finibus pharetra sem, at posuere ante vestibulum eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt ante sit amet euismod pulvinar. Aliquam a tristique purus. \nDonec at dapibus libero, sit amet consectetur eros. Integer ac dignissim mauris, vel ultrices mauris. Integer quis porttitor massa. Pellentesque non varius felis. Nunc imperdiet rhoncus dictum. Cras eu odio vel neque sollicitudin facilisis eu a urna. Quisque volutpat, nibh a dictum mollis, ipsum sem sagittis diam, id porta orci risus sit amet nulla. Suspendisse pellentesque mattis magna ut sollicitudin. Nunc imperdiet est lectus, non laoreet augue suscipit at. Phasellus tortor dui, euismod eget convallis id, varius sed massa.', user_id: 1}, {title: 'Three Rings for the Elven kings under the sky', contents: '"Seven for the Dwarf-lords in their halls of stone,\nNine for Mortal Men doomed to die,\nOne for the Dark Lord on his dark throne\nIn the Land of Mordor where the Shadows lie.\nOne Ring to rule them all, One Ring to find them,\nOne Ring to bring them all and in the darkness bind them\nIn the Land of Mordor where the Shadows lie."\n\n--J.R.R. Tolkein', user_id: 1}]
posts.each do |p|
  Post.create!(p)
end
