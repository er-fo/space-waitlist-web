FROM caddy:2.8.4-alpine

# Serve static files from /srv on port 8080
WORKDIR /srv
COPY . /srv

EXPOSE 8080
CMD ["caddy", "file-server", "--root", "/srv", "--listen", ":8080"]
