#!/bin/sh
set -Ceux
SQL1="ALTER TABLE Posts DROP INDEX idx_posts_message_txt;"
SQL2="ALTER TABLE Posts ADD FULLTEXT INDEX idx_posts_message_txt (\\\`Message\\\`) WITH PARSER ngram;"

docker-compose exec db bash -c " \
set -x;\
echo \"${SQL1}\" | mysql -u mmuser mattermost -pmmuser_password; \
echo \"${SQL2}\" | mysql -u mmuser mattermost -pmmuser_password; \
"
