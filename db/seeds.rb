# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t1 = Street.create(name: "tayaran", area: "madinet nasr")

User.create(email: "ahmed@etefy.com",password: "adminadmin",first_name: "ahmed", last_name: "etefy")
User.create(email: "kareem@etefy.com",password: "adminadmin",first_name: "kareem", last_name: "etefy")
User.create(email: "youssef@etefy.com",password: "adminadmin",first_name: "youssef", last_name: "adel")
User.create(email: "ali@etefy.com",password: "adminadmin",first_name: "ali", last_name: "ali")
User.create(email: "sherif@etefy.com",password: "adminadmin",first_name: "sherif", last_name: "ihaby")

Review.create(user_id: 1, review_content: "awesome",street_id: t1.id)
Review.create(user_id: 2, review_content: "multiple awesome",street_id: t1.id)

t2 = Street.create(name: "90 road", area: "5th setelment")
Review.create(user_id: 3, review_content: "multiple awesomeawesome",street_id: t2.id)
Review.create(user_id: 4, review_content: "multiple ",street_id: t2.id)


Friendship.create(user_id: 1, friend_id: 2)
Friendship.create(user_id: 1, friend_id: 3)
Friendship.create(user_id: 1, friend_id: 4)
Friendship.create(user_id: 2, friend_id: 4)
Friendship.create(user_id: 3, friend_id: 5)
Friendship.create(user_id: 5, friend_id: 2)

Post.create(user_id: 1, reciever_id: 1, post_content: "test notification")
Comment.create(post_id: 1, user_id: 1, comment_content: "test comment notification")
Comment.create(post_id: 1, user_id: 2, comment_content: "test multiple comment notification")

Post.create(user_id: 1, reciever_id: 2, post_content: "test nnnnnnnnnnotification")
Comment.create(post_id: 2, user_id: 1, comment_content: "test comment nnnnnnnnnotification")
Comment.create(post_id: 2, user_id: 2, comment_content: "test multiple comment nnnnnnnnotification")

t3 = Street.create(name: "shykh zayed", area: "10th of october")
Review.create(user_id: 5, review_content: "multiplmultiple ",street_id: t3.id)


# User.create(email: "alyezz@hotmail.com",facebook_id: "10153777438294644",password: "adminadmin",first_name: "ali", last_name: "ezz")
# Friendship.create(user_id: 6, friend_id: 5)
# Friendship.create(user_id: 1, friend_id: 6)
# Friendship.create(user_id: 2, friend_id: 6)
# Friendship.create(user_id: 3, friend_id: 6)
# Review.create(user_id: 6, review_content: "multiplmultiple2222222222 ",street_id: t3.id)
# Post.create(user_id: 6, reciever_id: 6, post_content: "i am soo bored")
# Comment.create(post_id: 3, user_id: 2, comment_content: "le kda bro")
# Comment.create(post_id: 3, user_id: 3, comment_content: "not again !!")

