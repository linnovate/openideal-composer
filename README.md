# Quick start

1. `composer create-project linnovate/openideal-composer YOUR_PROJECT_NAME`
2. `cd dir_name`
3. `docker-compose up`
4. `make`

Notes:
 * Before executing 4th step, you can edit installation properties in .env file.
 * Instead of 4th step, you can go to your browser and perform installation via UI.
 * We're assuming you're using [docker4drupal](https://github.com/wodby/docker4drupal).

## Configuration management
To export some changes from database to sync directory please use the following command:
`docker-compose exec php ../vendor/bin/drupal config:export --remove-uuid --remove-config-hash --directory=profiles/contrib/idea/config/install`

There are two ways to pull and apply the latest changes:

1. By performing a new installation (see "Quick start" section).

2. By pulling new changes from git repo and importing new changes from sync directory to the database:
`docker-compose exec php ../vendor/bin/drush cim --partial --source="profiles/contrib/idea/config/install"`

3. In non-development mode please manage configuration via `drush cim` and `drush cex` commands.

## Troubleshooting
1. Make sure the composer has been installed on your local machine, otherwise you need to install
the [composer](https://getcomposer.org/) before site installation
2. In this instruction, we're assuming you're using [docker4drupal](https://github.com/wodby/docker4drupal) and your
code files were mounted like this:
```yaml
  volumes:
    - ./:/var/www/html
```
3. Please make sure you don't have the following files in the config directory before importing configs via Drush:
 * core.extension.yml
 * system.site.yml
