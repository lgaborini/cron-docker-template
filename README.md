## Contents

This directory is a template for a `cron` job where a Docker container is built and executed.

A volume is automatically mounted in order to store output from the container.

## Installation

Edit the file `build_run.sh` with the correct variables.   

Make sure that `DOCKER_VOLUME_PATH_HOST` matches a (host) path which will contain the output from the container.   

Fill this directory with your job scripts, and customize your `Dockerfile` to launch your job.   
Add the relevant files to the Docker image with `ADD`.

Be sure that `WORKDIR` matches between the `Dockerfile` and `build_run.sh`.

Make sure that your job stores the output in `DOCKER_VOLUME_PATH_CONTAINER`.

Finally, install the `cron` job by modifying the `crontab` file: 
```
crontab -e
```

and add the following line: (be sure to specify the correct path, and the job parameters)
```
* * * * * PATH/build_run.sh
```



