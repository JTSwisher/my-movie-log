# My Movie Log

My movie Log, allows a user to search for movies and store movies to their account. The user can proivde a rating for the movie and any additional comments they would like to add. 

## Working Prototype

[ My movie Log](https://my-movie-log.herokuapp.com)

### Prerequisites

##### Install

[Postgres](https://postgresapp.com)


### Installing

Clone repo.
```
$ git clone "git@github.com:JTSwisher/my-movie-log.git"
```
Make sure dependencies in gemfile are available to app.
```
$ bundle install
```

##### Running Postgres

You will need the postgress app isntalled. Make sure the server is running.

Create the DB.
```
$ rake db:create
```

Migrate DB.
```
$ rake db:migrate
```
If the last two commands work Postgres was setup successfully

##### Run App 
```
$ shotgun
```

Navigate to:
```
http://localhost:9393/
```

## Built With

* Front-end: HTML5, CSS3, Ruby-ERB
* Back-end: Ruby, Sinatra, PostgreSQL
* Development ENV: Heoku

## Contributing

Bug reports and pull requests are welcome on GitHub at [](https://github.com/JTSwisher/my-movie-log). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

