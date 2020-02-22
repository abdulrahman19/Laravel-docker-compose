# :checkered_flag: Laravel docker compose
A pretty simplified docker-compose work-flow that sets up a LEMP network of containers for local Laravel development.


## Containers created with their versions and their ports (if used) are as follows:

- **nginx `stable-alpine`** - `:8080`
- **phpmyadmin `latest`** - `:8081`
- **mysql `8.0.19`** - `:3309`
- **php `7.3-fpm-alpine`** - `:9010`
- **npm `13.7`**
- **composer `latest`**
- **artisan**

## Folders structure
<pre>
├── mysql
│   └── [MySQL Database Binaries]
├── nginx
│   └── default.conf
├── php
│   └── php.ini
└── src
    └── [Laravel Project]
</pre>

## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

**Add your entire Laravel project to the `src` folder first**, change `artisan` file permission to `775`,
then open a terminal and from this cloned respository's root run `docker-compose up -d --build`.
Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Laravel app running as intended.

Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm composer [composer commands]`
- `docker-compose run --rm npm [npm commands]`
- `docker-compose run --rm artisan [artisan commands]`

You can stop containers by running `docker-compose down`.

## MySQL Information
```yml
MYSQL_DATABASE: dev_laravel
MYSQL_USER: laravel_user
MYSQL_PASSWORD: secret
MYSQL_ROOT_PASSWORD: root
```
feel free to change those values.

## PHP Extensions List

* redis
* xdebug
* mongodb
* pdo
* pdo_mysql
* zip
* tokenizer
* bcmath
* ctype
* json
* mbstring
* xml
* gd

## Troubleshooting

If you faced this error while you try connecting your MySQL database `SQLSTATE[HY000] [2054] The server requested authentication method unknown to the client`.

Please do the following:
```bash
docker exec -it mysql mysql -u root -p
```
Enter your password `secret`, then type this command in MySQL bash
```mysql
ALTER USER 'user' IDENTIFIED WITH mysql_native_password BY 'password';
```
Exit, and that's all ... You are ready now :fire:

## :rose: Acknowledgment

* [@aschmelyun](https://github.com/aschmelyun)
* [@Flayshon](https://github.com/Flayshon)
