FROM ubuntu

MAINTAINER Chi "chipoon@gmail.com"

# Install curl
RUN apt-get update && apt-get install -y curl
# Download and extract the executable to /usr/bin
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz 

# Automating some btsync setup
RUN btsync --dump-sample-config > btsync.conf
RUN sed -i 's/"listening_port" : 0/"listening_port" : 55555/' btsync.conf
RUN sed -i 's/"storage_path" : "\/home\/user\/.sync"/"storage_path" : "\/btsync\/.sync"/' btsync.conf

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
