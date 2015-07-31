This container when built runs a very simple behat test against
a multi-container docker web application.

It is intended to be a skeleton project, this container gets you up
and running with a basic "does the homepage return 200?" test, you are
encouraged to fork this project and add your own tests.

# How to use
Start your web application:
```
$ cd my-web-application/
$ docker-compose up
```
Or, if you are running your containers manually:
```
$ docker run -d --name my-web-application --expose 80 my-web-application
```

Now run this "testing container" against it:
```
$ docker run --rm --link my-web-application:web nimbleci/docker-base-tester-behat
```

This will run a very simple behat test which makes sure that the homepage returns
a 200 response code.

Now that you're up and running you can fork/copy this project and add your own
tests, with [Behat](http://behat.org) you can write comprehensive acceptance and
user tests, read more about Behat [here](http://docs.behat.org).

# Notes

This container assumes a few things about how you've set things up:
### It is linked to a container aliased to "web"
Internally the container tries to connect to the host called "web" so when you're
linking your project with this container you must alias the container you are
testing as "web". The alias is the second bit of the `--link` argument, this is
what the host is called inside the container.
### The website is available on port 80 of the linked "web" container
The container tries to connect to port 80 of the "web" host. You specify which
port the web container listens to in its `docker-compose.yml`.
### The container uses the mink-goutte-driver
To keep things simple we use the
[mink-goutte-driver](http://mink.behat.org/en/latest/drivers/goutte.html). There
are other drivers that you can use, each have their own pros and cons but they're
very easily switched. As mentioned, this container uses the goutte driver which
means that Javascript is not executed but tests are fast. Read up on the different
drivers and how to switch between them
[here](http://mink.behat.org/en/latest/guides/drivers.html).