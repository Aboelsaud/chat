# README

This README would normally document whatever steps are necessary to get the
application up and running.

# steps to run the app:

### 1- docker-compose up
### 2- docker-compose run app rake db:migrate

# endpoints

## applications

#### get api/applications => get all apps entry point
#### get api/applications/id => get specific app
#### delete api/applications/id => delete specific app
#### patch api/applications/id => update name of the app

and we use patch here because we need to update
the name only so we just send the name and
we don't need to send the whole body to edit the name


## chats
#### get api/applications/application_token/chatis => get all chats related to that app
#### post api/applications/:token/chatis/create => create chat
#### put api/applications/:token/chatis/:id/edit => update chat
#### get api/applications/:token/chatis/:id => get specific chat


## messages
#### get api/applications/:token/chatis/:chati_id/messages => messages#getChatsMessages
#### post api/applications/:token/chatis/:chati_id/messages/create => messages#create
#### patch api/applications/:token/chatis/:chati_id/messages/:id/edit => messages#update
