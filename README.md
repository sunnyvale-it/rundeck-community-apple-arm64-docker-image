


Build the image 

```console
$ docker buildx build --platform linux/arm64 -t sunnyvaleit/rundeck-community:3.4.8-20211214-1 . --load
```

Inspect the container

```console
$ docker run -ti --rm --entrypoint /bin/bash sunnyvaleit/rundeck-community:3.4.8-20211214-1 
```

Run the container

```console
$ docker run -ti -p 4440:4440 -e JAVA_XMX=2048m -e JAVA_XMS=1024m sunnyvaleit/rundeck-community:3.4.8-20211214-1 
```