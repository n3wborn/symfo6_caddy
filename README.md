# Symfony6 and Caddy

**This is more a poc than anything else. Do not use this unless you know what you're doing ^^**

I wanted to have Caddy as a reverse proxy for my local development running inside Docker containers.

This way, Caddy is contacted first, translate my-app.localhost to whatever url I give in it's Caddyfile.
I can simply keep my-app.localhost in front and change symfo6 to whatever server name running in another
Docker contained project.

As long as the other project use the same external network (which must be created
first with `docker network create <network-name>`), containers can talk to each others and Caddy can
"translate" url's.

Caddy config is quite simple finally, and it servers HTTPS/HTTP-2/HTTP-3 by default.

As this was just a poc for myself, this repo may be updated (I should separate it in two) or removed if I make something
more reliable later but if it helps, feel free to use it.
