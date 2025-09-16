# Desafío para Desarrollador Backend - DRIVIN

El siguiente proyecto Ruby on Rails es desarrollado para un desafio. 

Para poder crear y ejecutar primero se debe: 

```bash
docker compose up --build
```

Para confirmar de que esta levantado Ruby on Rails en el puerto 3500 que es el puerto que se establece.

```bash
http://localhost:3500/
```

Las versiones son:

* Versión de Ruby: ruby 3.4.5 
* Versión de Ruby on Rails: 8.0.2.1

Para poder migrar y crer las tablas ejecutamos en el bash:

```bash
docker compose run app bash
rails db:create db:migrate
```

Para realizar pruebas se uso https://rspec.info/

Para ejecutar las pruebas debo ejecutar:

```bash
docker compose run app bash
bundle exec rspec 
```
