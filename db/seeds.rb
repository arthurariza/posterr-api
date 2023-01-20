# frozen_string_literal: true

user_one = User.create(username: 'User One')
user_two = User.create(username: 'User Two')
user_three = User.create(username: 'User Three')
user_four = User.create(username: 'User Four')

Post.create(body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', post_type: 0, user_id: user_one.id)
Post.create(body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', post_type: 0, user_id: user_two.id)
Post.create(body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', post_type: 0, user_id: user_three.id)
Post.create(body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', post_type: 0, user_id: user_four.id)
