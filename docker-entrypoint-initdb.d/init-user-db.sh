#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER git CREATEDB;
    CREATE EXTENSION IF NOT EXISTS pg_trgm;
    CREATE DATABASE gitlabhq_production OWNER git;
EOSQL
