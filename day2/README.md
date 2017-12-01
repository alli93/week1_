# Docker Exercise
The goal of the assignment was to create a node:carbon docker image, and then using
docker-compose to run a container of that image along with a redis DB container. 

## What is Docker?
Docker is a tool designed to package together source code, libraries and dependencies into images for use on Linux machines independent of configuration or infrastructure.

## What is the difference between:
* Virtual Machine
* Docker Container
* Docker Image
A Virtual Machine contains an entire operating system and it's goal is to provide an abstraction for physical hardware. A Docker Container provides an abstraction at the app layer for the host operating system to communicate with. As such, containers do not contain an operating system like virtual machines do, all they contain is binaries, libraries and dependencies. A Docker Container is a running instance of a Docker Image that is loaded into memory.

## What is docker-compose:
docker-compose is a tool for running multiple containers simultaneously, and allowing them to service one-another. 

## Results
A basic understanding of docker images their creation and usage was achieved
