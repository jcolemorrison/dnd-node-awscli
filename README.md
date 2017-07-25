This Docker file builds a docker image has 5 primary things

1) Docker
2) Node.js
3) Yarn
4) AWS CLI
5) Python

It's based off of the official Docker image, and therefore is ultimately based off of the Alpine Linux 3.6 image.

It's purpose at the moment is to exist as a build image for CircleCI.  It has all of the requirements of a CircleCi custom image and allows one to build / test Node.js images and push them up to either Docker Hub or AWS ECR.

On AWS Codebuild:

It may or may not work with AWS Codebuild, I'm still meaning to test that.  But the official AWS Codebuild images are much heavier, based off of Ubuntu 14.04.5, have a ton of extra dependencies and most importantly marked as "optimized for AWS Codebuild."
