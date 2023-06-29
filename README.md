# Idea Quest API
This is the repo for the backend interface between the database and the client

### Steps to run locally
#### Run the following commands in the terminal
- `npm ci`
- `npm run start`
#### Steps to setup database
- Ensure postgres is installed on your machine (We recommend installing via Homebrew)
- Enter the postgres terminal by typing `psql` into the terminal
- Now create a database using the following command: `CREATE DATABASE idea_quest_local;`
- Navigate into the database using: `\c idea_quest_local`
- Run the schema sql file via the absolute path in the codebase: `\ir [path to codebase]/idea-quest-api/src/database/dbSchema.sql`
- Run the seed data sql file: `\ir [path to codebase]/idea-quest-api/src/database/dbSeedData.sql`
### Contributing Notes
Be sure to install ESLint on your IDE or run `npm run lint` before committing
