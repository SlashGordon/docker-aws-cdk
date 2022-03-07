# Docker AWS CDK
Containerised AWS CDK to ensure consistent local development and simple CD pipelines.

## Usage
Run as a command using `cdk` as entrypoint:

    docker run --rm --entrypoint cdk emetriq/aws-cdk --version

Run as a shell and mount `.aws` folder and current directory as volumes:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app emetriq/aws-cdk bash

Using docker-compose:

    cdk:
        image: emetriq/aws-cdk
        env_file: .env
        entrypoint: aws
        working_dir: /opt/app
        volumes:
        - ~/.aws:/root/.aws
        - .:/opt/app:rw

And run `docker-compose run cdk --version`

## Language Support

CDK Supports different languages to define your (re)usable assets.

### JavaScript/TypeScript

This should work out of the box through `package.json` and `node_modules`, which
are automatically _cached_ in your working directory.

### Python

This image ships with Python 3 installed. To cache installed cdk python packages,
`site-packages` is exposed as a volume. This allows you to cache packages between
invocations:

    cdk:
        ...
        volumes:
        - cdk-python:/usr/lib/python3.7/site-packages/
        - ...
    volumes:
        cdk-python

Then, if you install e.g. `aws-cdk.core` through pip (`pip3 install aws-cdk.core`)
in a container, you won't have to install it again next time you start a new
container.


## Related Projects

- [docker-aws-cli](https://github.com/emetriq/docker-aws-cli)
- [docker-terraform](https://github.com/emetriq/docker-terraform)

## Credits

Strongly inspired by[contino/docker-aws-cdk](https://github.com/contino/docker-aws-cdk) project.
