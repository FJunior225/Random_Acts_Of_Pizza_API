fn = {
  fb_userID: 0,
  first_name: "FJ and Noah",
  email: "none"
}

joe = {
  fb_userID: 11111,
  first_name: "Joe",
  email: "joe@email.com",
}

monica = {
  fb_userID: 22222,
  first_name: "Monica",
  email: "monica@email.com"
}

bob = {
  fb_userID: 33333,
  first_name: "Bob",
  email: "bob@email.com"
}

fred = {
  fb_userID: 44444,
  first_name: "Fred",
  email: "fred@email.com"
}

sally = {
  fb_userID: 55555,
  first_name: "Sally",
  email: "sally@email.com"
}

users = [fn, joe, monica, bob, fred, sally]

users.each do |user|
  User.create(fb_userID: user[:fb_userID], first_name: user[:first_name], email: user[:email])
end

request0 = {
  creator: fn,
  first_name: "FJ and Noah",
  title: "Random Acts of Pizza",
  pizzas: 0,
  vendor: "RAOP",
  video: "111.com"
}

request1 = {
  creator: joe,
  first_name: "Joe",
  title: "Joe needs a pizza.",
  pizzas: 2,
  vendor: "Papa Johns",
  video: "123.com",
  donor_id: 1
}

request2 = {
  creator: monica,
  first_name: "Monica",
  title: "Monica needs a pizza.",
  pizzas: 2,
  vendor: "Dominos",
  video: "456.com"
}

request3 = {
  creator: bob,
  first_name: "Bob",
  title: "Bob needs a pizza.",
  pizzas: 3,
  vendor: "Pizza Hut",
  video: "789.com"
}

requests = [request0, request1, request2, request3]

requests.each_with_index do |request, index|
  Request.create!(creator: User.find(index+1), first_name: request[:first_name], title: request[:title], pizzas: request[:pizzas], vendor: request[:vendor], video: request[:video], donor_id: request[:donor_id])
end
