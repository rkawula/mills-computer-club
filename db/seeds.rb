# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


posts = [
	{   title: 'End of Year Celebration',
		contents: "End of year celebration party will be held on May 07, 2015 from 5-8 PM! Everyone is invited. It will be a potluck, but don't stress if you can't bring food.

		Address: 4362 Steele Street, Oakland CA, 94619
		",
		user_id: 1,
		img_url: 'img/blog-1.jpg' },
	{   title: 'New Officers',
	    contents: "MCC:
	    President: Angelica Leyva-McMurtry
	    VP: Gloriane Tran
	    Publicity: Allison David
	    Treasurer: Elise Richards
	    Historian: Deana Bui
	    Website Admin: Brighid Wilhite, Ruellia Zhang

	    MICE:
	    President: Heather Myers
	    Treasurer: Ashley Ongsarte
	    Website Admin: Rachel Kawula",
		user_id: 1,
		img_url: 'img/blog-2.jpg' },
	{   title:  "Grace Hopper",
		contents: "2015 Grace Hopper Celebration of Women in Computing will be held October 14 – 16 in Houston, Texas.
            \"Started in 1994, GHC is now the world’s largest gathering of women technologists. In 2013, GHC hosted over 4,750 attendees from 53 countries including 1,900 students from over 400 academic institutions and 2,850 professionals from industry, government and academia.   The conference features keynotes by prominent women in technology, career workshops, and technical tracks from leading researchers and the best of ACM SIGSOFT & SIGGRAPH.  Meet the women who are transforming technology at the Grace Hopper Celebration.\"",
            img_url: 'img/blog-3.jpg'
    }
	]
posts.each do |p|
  Post.create!(p)
end


officers = [
	{ name: "Angelica McMurtry",
	  title: "President",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  	{ name: "Gloriane Tran",
	  title: "Vice President",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  	{ name: "Elise Richards",
	  title: "Treasurer",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  	{ name: "Allison David",
	  title: "Publicity",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  	{ name: "Deana Bui",
	  title: "Historian",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  { name: "Ruellia Zhang",
	  title: "Website Assistant",
	  img_url: "/img/intro-pic.jpg",
	  undergrad: true
	  },
	  { name: "Heather Myers",
	  title: "President",
	  img_url: "/img/heather2.jpg",
	  undergrad: false
	  },
	  { name: "Ashley Ongsarte",
	  title: "Treasurer",
	  img_url: "/img/ashley.jpg",
	  undergrad: false
	  },
	  { name: "Rachel Kawula",
	  title: "Website Admin",
	  img_url: "https://s3-us-west-1.amazonaws.com/millscc/rachel.jpg",
	  undergrad: false
	  }
]

officers.each do |o|
	Officer.create! o
end

Hackathon.create! semester: 'spring', year: 2016