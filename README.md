# Astroserver

AlterCode's [Astroneer Server Docker Image](https://gitlab.com/altercode/astroneer-linux/) fork.

## Docker

```
docker run -ti 
    -e OWNER_NAME=name
    -e OWNER_GUID=0 
    -e SERVER_NAME=servername
    -e SERVER_PASS=123456
    -e SERVER_PORT=7777
    -e SERVER_FPS=30.000000
    -e SAVE_INTERVAL=300
    -e BACKUP_INTERVAL=1800
    -p 7777:7777/udp  
    astroserver
```

## Compose

```
version: "3.9"

services:
  astroneer:
    image: astroserver
    container_name: astroneer_server
    restart: unless-stopped
    environment:
      OWNER_NAME: ""
      OWNER_GUID: "0"
      SERVER_PORT: "7777"
      SERVER_NAME: "AstroServer"
      SERVER_PASS: "123456"
      SERVER_FPS: "30.000000"
      SAVE_INTERVAL: "300"
      BACKUP_INTERVAL: "1800"
    ports:
      - "7777/udp"
    volumes:
      - /saves:/astroneer/Astro/Saved/SaveGames
      - /backup:/astroneer/Astro/Saved/Backup
```

## Game client setup

Add:

```ini
[SystemSettings]
net.AllowEncryption=False
```
to configuration file:

`%AppData%\..\Local\Astro\Saved\Config\WindowsNoEditor\Engine.ini`

## Check server status

[servercheck.spycibot.com](https://servercheck.spycibot.com/ )