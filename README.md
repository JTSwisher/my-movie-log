My Movie Log

My movie Log, allows a user to search for movies and store movies to their account. The user can proivde a rating for the movie and any additional comments they would like to add. 

## Working Prototype

(https://my-movie-log.herokuapp.com "My Movie Log")

### Prerequisites

##### Install
```
(https://postgresapp.com/ "Postgres App)
```

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

Create the database.
```
$ rake db:createa
```

Migrate database
```
$ rake db:migrate
```
If the last two commands work Postgres was setup successfully

##### Run App 
```
$ shotgun
```

Navigate to 

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

