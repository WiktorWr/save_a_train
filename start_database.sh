#/usr/bin/env bash
docker run --name save_a_train_postgres -p 5432:5432 -e POSTGRES_USER=save_a_train -e POSTGRES_PASSWORD=save_a_train -d postgres:12-alpine
