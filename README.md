BitTorrent Sync Dockerfile
==========================

This will build a [docker](http://www.docker.io/) image that runs [BitTorrent Sync](http://labs.bittorrent.com/experiments/sync.html).


### Building the Image ###

```
docker build -t btsync .
```


### Running BitTorrent Sync ###

```
docker run -d -p 8888:8888 -p 55555:55555 -v /srv/btsync/:/btsync/ btsync
```

`-d` run in detached mode

`-p` expose container port `[public-port]:[container-port]`
> btsync.conf sets the container ports 8888 as the web ui and 55555 as the listening port

`-v` mount a local directory in the container `[host-dir]:[container-dir]`
> btsync.conf should be located in a directory mounted to the container directory `/btsync/`


### Accessing BitTorrent Sync WebUI ###

http://&lt;yourdomain.com&gt;:8888

login: admin
<br>password: password

<p>Turn off access to the web ui by not exposing port 8888
```
docker run -d -p 55555:55555 -v /srv/btsync/:/btsync/ btsync
```


