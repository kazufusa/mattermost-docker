# Setup

```
$ mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins,client-plugins}
$ sudo chown -R 2000:2000 ./volumes/app
$ sudo docker-compose up db # and wait
$ docker-compose up
$ docker-compose exec db bash
$ mysql -u mmuser mattermost -pmmuser_password
> ALTER TABLE Posts DROP INDEX idx_posts_message_txt;
> ALTER TABLE Posts ADD FULLTEXT INDEX idx_posts_message_txt (`Message`) WITH PARSER ngram COMMENT 'ngram index sample';
```
