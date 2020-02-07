## Install

### Create Nuxt app

- run `yarn create nuxt-app <nom-de-mon-app>`

### Install app on docker

- Edit `.env` & `Makefile` `PROJECT_NAME` variables.
- run :

``` bash
$ make install
```

- visit `http://localhost:85/`

### edit port:

-> docker-compose under `PORT`