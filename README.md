# Dockerized TDEFNODE

Getting all the local requirements setup to run this stuff is a pain, especially on macOS.

## Requirements

- [Docker][1]

## Instructions

Clone the repo:

```sh
git clone git@github.com:jaredonline/tdefnode-docker
```

Change to the new cloned repository:

```sh
cd tdefnode-docker
```

Build the images:

```sh
docker-compose build
```

Move the files you want to process into the directory:

```sh
cp ~/PATH/TO/YOUR/FILES ./
```

Run the docker image:

```sh
docker-compose run --rm tdefnode NAME_OF_YOUR_FILE
```

The results of your processing will be in your local directory. To clean up any Docker related leftovers:

```sh
docker-compose down
```

## Customization

`tdefcom1.h.tmp` contains a bunch of constant declarations that change the way TDEFNODE behaves. If you want / need to change any of those declarations, you can change them and re-run `docker-compose build --force-rm` to rebuild the Docker image and then re-run `docker-compose run tdefnode PATH_TO_YOUR_INPUT`.

[1]: https://docs.docker.com/install/
