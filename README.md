This Docker file builds a docker image has 5 primary things

1) Docker
2) Node.js
3) Yarn
4) AWS CLI
5) Python

It's based off of the [official Docker image](https://hub.docker.com/_/docker/), and therefore is ultimately based off of the **Alpine Linux 3.6** image.

It's purpose at the moment is to exist as a build image for CircleCI.  It has all of the requirements of a CircleCi custom image and allows one to build / test Node.js images and push them up to either Docker Hub or AWS ECR.

The official docker hub reporsitory here:

[jcolemorrison/dnd-node-awscli](https://hub.docker.com/r/jcolemorrison/dnd-node-awscli/)

Notes:

1) If you want to change the version of Node or Yarn, or anything with APK, you need to make sure it's available for Alpine 3.6

For example, the only APK nodejs available is 6.10.3.  That's why it's the version here.  To change the version of Alpine, point to a different [official Docker docker image](https://hub.docker.com/_/docker/).  This one is based off of `17.06.0-ce`. And that means it's underlying Alpine is 3.6.

[You can find a list of node verisons here](https://pkgs.alpinelinux.org/packages?name=nodejs&branch=&repo=&arch=&maintainer=)

[And a list of yarn versions here](https://pkgs.alpinelinux.org/packages?name=yarn&branch=&repo=&arch=&maintainer=)

The "branch" is the verison of Alpine.  So this image works off of 3.6

2) On AWS Codebuild:

It may or may not work with AWS Codebuild, I'm still meaning to test that.  But the official AWS Codebuild images are much heavier, based off of Ubuntu 14.04.5, have a ton of extra dependencies and most importantly marked as "optimized for AWS Codebuild."

3) With CircleCI 2.0, make sure to use the `setup_remote_docker` option in your steps if you intend on using the Docker client.

---

This is put together for working with the [Practical and Professional Devops with AWS and Docker](https://awsdevops.io/p/practical-and-professional-devops-with-aws-and-docker) series.
