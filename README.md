# betterdns
A docker image for dnscrypt-proxy with different servers resolving Chinese and International domains.

# How to use
```
docker run --network-host qwerzl/betterdns:latest
```
The default port is `533`. `--network=host` must be set or it won't function properly. 

# Misc
The default config is set with `DNSPod` as domestic resolver and `Google/Cloudflare/IIJ DoH` as international resolver.

Also, I've disabled `cache` as this container is designed to use with another frontend like `AdguardHome` or `PiHole`.

Feel free to fork this repo and customize it to your own need.
