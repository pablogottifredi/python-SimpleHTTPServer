# Simple HTTP Server using Python as container to serve files
Applying concepts of [12-factor-app](https://12factor.net/) desing you must try to have a [parity between production and dev enviroment](https://12factor.net/dev-prod-parity)
Following that rule, a good practices is try to not install additionals tools in your computer to made quick proof or test of portions of code. 
The idea is mantain isolated your computer of unnecesary instalations, even about http servers and configs to run

### Warning
This first approach was built using third parties [images](elyase/staticpython)

## Some concepts applied (5/12)
* Self-contained application
   Only put your code (HTML, Javascript) into the ***./src*** folder
* Dev/Prod parity
   Without additionals local instalation to run, OS independence, only you need docker && docker-compose 
* Enviroment config
   Ready to setup using ***.env*** file
* Dependencies
   Ready to setup additional dependencies in ***package.json*** file
* Port binding
   You can configure the port map into ***docker-compose.yml*** or ***Dockerfile***. Setted to work at ***8083 port***

### Pending (3/12)
* Build,release,run
* Disposability
* Logs

# Getting started
## Previous requirements
* [Docker CE version 18.09.04 or up](https://docs.docker.com/install/linux/docker-ce/ubuntu/) 
* [Docker Compose version 1.24.0 or up](https://docs.docker.com/compose/install/) 
* [Git client](https://git-scm.com/)

## Clone or manage your code in Fork of the original reposiory

You can use simply doing a clone of the repo and using into a local environment
```
git clone https://github.com/pablogottifredi/python-SimpleHTTPServer.git
```

But, this is not your place to made push request, so, you must make a Fork of the project, you can follow an step by step instruction [here[(https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/)
* Making a local clone
```
git clone https://github.com/pablogottifredi/python-SimpleHTTPServer.git
```
* Adding a Remote
```
git remote add upstream https://github.com/pablogottifredi/python-SimpleHTTPServer.git
```
* Create a [Branch](https://12factor.net/codebase)
```
git checkout -b branch-my-own-code
```

## How to use
In your development enviroment you can work and put your code in the ***./src*** folder
The docker-compose is configured to map the folder and running directly into the container images
So, any changes in your code are immediately impacted


You can see this configuration in docker-compose.yml file
```
   volumes:
      - ./src:/var/www
```

## How tu run
### Start
```
docker-compose up
```

The docker-compose is configured at 8083 port, you can run [http://localhost:8083/index.html](http://localhost:8083/index.html) in your browser or run
```
CURL -G http://localhost:8083/index.html
```


And you can edit your code in the local folder ***./scr*** code

### If for any reason you must look an internal configuration of the serer
```
docker container ps

```
Identify the container id
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                              NAMES
a14332452d98        server-code-pyhton  "python -m SimpleHTT…"   21 seconds ago      Up 16 seconds       8080/tcp, 0.0.0.0:8083->8083/tcp   server-code-pyhton
```

Run shell into
```
docker exec -ti a14332452d98 sh
```

Now your are in the shell into de container


### You have changes in your code? Update it
* Push if you have changes
```
git push origin feature/my-feature
```
* Merge to master of your repo
```
git branch -d branch-my-own-code
git push origin master
```

### License
This code use portion of code for third parties
* [busybox](https://hub.docker.com/_/busybox) for a linux version maintained for Docker Comunity
* [elyase/staticpython](https://hub.docker.com/r/elyase/staticpython) for adding a precompiled image of python 2.7
