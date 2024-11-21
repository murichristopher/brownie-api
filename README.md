### How to run this project

* Install dependencies

```bash
bundle
```

* Prepare docker database

```bash
make db
```

Or, if any issues with database:

```bash
docker kill my_postgres
```

Then start the docker database again

```bash
make db
```

* Init database

```bash
rails db:drop db:create db:migrate db:seed
```

* Start the server

```bash
rails s -p 4000
```