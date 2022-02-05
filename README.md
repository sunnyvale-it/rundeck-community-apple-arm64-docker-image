


Build the image 

```console
$ docker buildx build --platform linux/arm64 -t sunnyvaleit/rundeck-community:3.4.8-20211214-1 . --load
```

In this image will be installed also Python 3, useful for running Python jobs with localhost executor.

Inspect the container

```console
$ docker run -ti --rm --entrypoint /bin/bash sunnyvaleit/rundeck-community:3.4.8-20211214-1 
```

Run the container

```console
$ docker run -ti -p 4440:4440 -e JAVA_XMX=2048m -e JAVA_XMS=1024m sunnyvaleit/rundeck-community:3.4.8-20211214-1 
```

Open your browser and point to http://localhost:4440/

Deault username and password are **admin**/**admin**

Within the GUI you have to:

- create a project
- create a job within the project (you can upload the job definition using file HelloBashJob.yaml)
- create an API auth token

For this demo I created:

```console
$ export PROJECT_NAME="Test_Project"
$ export JOB_NAME="HelloBashJob"
$ export JOB_UID="8abaf5e9-6842-4091-98c9-99480a27fa2f"
$ export AUTH_TOKEN="qw1XwWuE37SnafcyORrskrS4eh28oxdZ"
```

To call the job via REST API:


```console
$ curl -D - \
-X "POST" -H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "X-Rundeck-Auth-Token: $AUTH_TOKEN" \
-d "{\"argString\":\" -arg1 value1 -arg2 value2 \"}" \
http://localhost:4440/api/16/job/$JOB_UID/run
```