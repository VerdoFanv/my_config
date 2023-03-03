# Heroku Commands
- ```heroku login```
- ```heroku create proyekname```

## Push to heroku
- ```git init```
- ```heroku git:remote -a proyekname```
- ```heroku addons:create heroku-postgresql:hobby-dev```
- ```heroku addons:create heroku-redis:hobby-dev```
- ```git push heroku master/main```

## Another commands
- ```heroku pf:psql```
- ```heroku run bash```
- ```heroku ps```
- ```heroku ps:scale web=1```
- ```heroku ps:scale web=0```
- ```heroku open```
- ```heroku local web```
- ```heroku logs --tail```
- ```heroku config:set```
- ```heroku logs -p postgres -t```
- ```heroku ps:restart```
- ```heroku plugins:install heroku-repo```
- ```heroku repo:reset --app appname```
- ```heroku plugins:install https://github.com/naaman/heroku-vim```

## Procfile
```web: npm run start```

## heroku postgres config
```PGSSLMODE=no-verify```