This container when built runs a very simple behat test against
a multi-container docker web application.

It is intended to be a skeleton project, this container gets you up
and running with a basic "does the homepage return 200" test, you are
encouraged to fork this project and add your own tests.

# How to use
Start your web application (and any other containers it depends on too).
You can use docker-compose or run just the web server container on its
own.
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

This container assumes a few things about how you've set things up:
### It is linked to a container aliased to "web"
Internally the container tries to connect to the host called "web" so when you're
linking your project with this container you must alias the container you are
testing as "web". The alias is the second bit of the `--link` argument, this is
what the host is called inside the container.
### The website is available on port 80 of the linked "web" container
The container tries to connect to port 80 of the "web" host. You specify which
port the web container listens to in its `docker-compose.yml`.