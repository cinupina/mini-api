# mini-api

Example Go API compact build using flags and upx. For complete tutorial on creating smallest and secure Go Docker images: https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324

```shell
$ docker images | grep mini
mini-api     9bfb594b4071     2 minutes ago     2.05MB
```

## Usage

To build and run:
```shell
$ sh build.sh
$ docker run -it -p 8080:8080 mini-api:1
```

In another terminal session:
```shell
$ curl localhost:8080
Hello world!
```