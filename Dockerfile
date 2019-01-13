# Sample Dockerfile

FROM alpine

LABEL maintainer="Your name"

WORKDIR /payload

ADD job.sh .

CMD ["sh", "job.sh"]
