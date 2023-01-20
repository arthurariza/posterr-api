# README

## Improvements

### What you would improve if you had more time?

- Implement Authentication And Authorization
- Better Error Handling
- Move Posts creation to a background Job using Redis/Sidekiq
- Move the api to a Docker container
- Setup CI/CD
- Deploy api to a cloud provider

## Setup:

- docker-compose up
- bundle install
- bundle exec rails db:setup
- bundle exec rails db:seed
- bundle exec rails s

## Endpoints:

### GET /posts

List 10 posts on a reverse chronological order
Use /posts?page=1 to change page
Use /posts?limit=5 to change the amount of posts displayed
Combine both /posts?page=1&limit=5

### GET /posts/:id

Show information about a particular post

### POST /post

Add new post
Example Request Body
`{ "post": { "body": "Post", "user_id": 2 } }`

### POST /post/repost

Add new repost post
Example Request Body
`{ "post": { "user_id": 1, "post_id": 56 } }`

### POST /post/quote

Add new quote post
Example Request Body
`{ "post": { "body": "Quote Post", "user_id": 2, "post_id": 55 } }`

### GET /users

List all users.

### GET /users/1

Show information about a particular user

### GET /users/:id/post

List 5 posts on a reverse chronological order from a specific user
