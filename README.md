# oboco-frontend-heroku

[oboco-frontend](https://gitlab.com/jeeto/oboco-frontend) for heroku (work in progress).

## requirements

- heroku cli
- docker

## configuration

- heroku
	- create app oboco-frontend

## build

- heroku container:login
- heroku container:push web --app oboco-frontend

## run

- heroku container:release web --app oboco-frontend
- heroku logs --tail --app oboco-frontend

## test

- heroku open --app oboco-frontend (https://oboco-frontend.herokuapp.com/)

## development

- clone
	- git clone --recurse-submodules https://gitlab.com/jeeto/oboco-frontend-heroku.git
- add oboco-frontend
	- git submodule add https://gitlab.com/jeeto/oboco-frontend.git
	- git submodule init
- pull oboco-frontend
	- cd oboco-frontend
	- git pull
- configuration
	- .env
- build
	- docker-compose build
- run
	- docker-compose up
- test
	- http://127.0.0.1:8080/