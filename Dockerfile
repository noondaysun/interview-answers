FROM alpine:3.9

# Install the basic php stuff we need


COPY ./app /app
WORKDIR /app