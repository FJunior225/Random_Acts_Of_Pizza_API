noah = {
  fb_userID: 12345,
  first_name: "Noah",
  email: "noah@email.com"
}

fj = {
  fb_userID: 67890,
  first_name: "FJ",
  email: "fj@email.com"
}

bob = {
  fb_userID: 11111,
  first_name: "Bob",
  email: "bob@email.com"
}

fred = {
  fb_userID: 22222,
  first_name: "Fred",
  email: "fred@email.com"
}

sally = {
  fb_userID: 33333,
  first_name: "Sally",
  email: "sally@email.com"
}

users = [noah, fj, bob, fred]

users.each do |user|
  User.create(FB_userID: user[:fb_userID], first_name: user[:first_name], email: user[:email])
end

request1 = {
  creator: noah,
  title: "Noah needs a pizza.",
  city: "Denver",
  state: "CO",
  pizzas: 1
}

request2 = {
  creator: fj,
  title: "FJ needs a pizza.",
  city: "San Diego",
  state: "LA",
  pizzas: 2
}

request3 = {
  creator: bob,
  title: "Bob needs a pizza.",
  city: "New York",
  state: "NY",
  pizzas: 3
}

requests = [request1, request2, request3]

requests.each_with_index do |request, index|
  Request.create(creator: User.find(index + 1), title: request[:title], city: request[:city], state: request[:state], pizzas: request[:pizzas])
end
