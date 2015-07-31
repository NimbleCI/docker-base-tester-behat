This container when built runs a very simple behat test against
a multi-container docker web application.

It is intended to be a skeleton project, this container gets you up
and running with a basic "does the homepage return 200" test, you are
encouraged to fork this project and add your own tests.

For it to work it assumes a few things:
* It is linked to a container aliased to "web"
* The website is available on port 80 of the linked "web" container

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