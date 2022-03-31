# README

This README would normally document whatever steps are necessary to get the
application up and running.

# steps to run the app:

### 1- docker-compose up
### 2- docker-compose run app rake db:migrate

### then type localhost:3001/api/applications and an index page will appear.

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


## screenshots
![unknown2](https://user-images.githubusercontent.com/49989018/160987370-1a6e501e-2de2-460b-ad7f-aa4afbb6af1b.png)
![unknown3](https://user-images.githubusercontent.com/49989018/160987373-60a90486-0ab5-473e-afdd-6f7541d05612.png)
![unknown4](https://user-images.githubusercontent.com/49989018/160987376-d044a7f2-336a-4000-9db7-3e9a78268dd7.png)
![unknown5](https://user-images.githubusercontent.com/49989018/160987378-7f96bf4e-f39c-4e4e-b03d-1ad93e82d231.png)
![unknown6](https://user-images.githubusercontent.com/49989018/160987380-4c24f618-47f5-4367-b3b6-09c3b458ff27.png)
![unknown](https://user-images.githubusercontent.com/49989018/160987382-7ecd228e-e2ae-42ee-a426-99840443d5fe.png)
