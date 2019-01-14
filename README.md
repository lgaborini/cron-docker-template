## Contents

This directory is a template for a `cron` job where a Docker container is built and executed.

A volume is automatically mounted in order to store output from the container.

## Requirements

- Docker
- utility `realpath`

## Installation

### Job configuration

Edit the file `build_run.sh` with the correct variables.   

Make sure that `$DOCKER_VOLUME_PATH_HOST` matches a host path which will contain the output from the container.   

Fill this directory with your job scripts, and customize your `Dockerfile` to launch your job.   

Add the relevant files to the Docker image with `ADD`.   
Be sure that `WORKDIR` matches between the `Dockerfile` and `build_run.sh`.

Also, make sure that your job stores the output in `$DOCKER_VOLUME_PATH_CONTAINER`.

### cron configuration

Finally, install the `cron` job by modifying the `crontab` file: 
```
crontab -e
```

and add the following line: (be sure to specify the correct absolute path, and the job parameters)
```
* * * * * PATH/build_run.sh
```

A sample job `job.sh` is provided: it echoes the current time into the file `$DOCKER_VOLUME_PATH_HOST/OK`. If the file appears, the installation is successful!
