# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Business requirements

This is "good night" application to let users track when do they go to bed and when do they wake up.

The requirements of this restful APIS to achieve the following:

1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records of a user's All friends from the previous week, which are sorted based on the duration of All friends sleep length.
4. No need to implement any user registration API.

### System version
- Ruby  `3.0.0`
- Rails `7.0.4.3`

### Database initialization
We use SQLite3 for development and test environments.

- Run `rails db:migrate` to create the database.
- Run `rails db:seed` to populate the database with some data.

### How to run locally
- Run `rails s` to start the server.
- Run `rails c` to open the console.

It will open the server on `localhost:3000`.

You can test it in the Postman app and use this collections: https://solar-desert-450031.postman.co/workspace/My-Workspace~807d45b9-4a3f-40ea-869f-ed95144d3acf/collection/11525171-80ebf613-5f60-4ac5-82fc-9ed66f683824?action=share&creator=11525171