# Example Data Models

The goal of this project is to showcase example data models for real world applications. The content in this repository should
be a conversation starter and not the end all be all.

## Setup

The setup here assumes you have Ruby and Docker installed and setup on your local computer.

Clone the repo.

```sh
git clone git@github.com:alvincrespo/data_models.git
```

Start the database container.

```sh
docker compose up
```

Navigate to the desired project:

```sh
cd examples/ecommerce
```

Run bundle install:

```sh
bundle
```

or

```sh
bundle install
```

Create the database

```sh
bundle exec rails db:create
```

Migrate the database

```sh
bundle exec rails db:migrate
```

Congrats! You have now setup the application and can start tinkering with the example.

