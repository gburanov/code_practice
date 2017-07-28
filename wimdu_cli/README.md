# Wimdu CLI interface

## Start work
* Initialize database

    $ rake db:create

    $ rake db:migrate

* Show help

    $ bin/wimdu

* Prepare for tests

    $ DATABASE_ENV=test rake db:create

    $ DATABASE_ENV=test rake db:migrate