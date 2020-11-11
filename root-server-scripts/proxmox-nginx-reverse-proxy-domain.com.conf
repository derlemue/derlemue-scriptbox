###############################################
## nginx reverse proxy   v1.0 | GNU GPL 3.0  ##
## contact:    admin@derlemue.com            ##
##             https://discord.gg/rWpXfXHuf8 ##
###############################################
server {
        server_name www.domain.com;
        index index.html index.htm index.nginx-debian.html index.php;
        location / {
                proxy_pass http://127.0.0.1:8080;
                proxy_set_header    X-Real-IP           $remote_addr;
                proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
                proxy_set_header    X-Forwarded-Proto   $scheme;
                proxy_set_header    Host                $host;
                proxy_set_header    X-Forwarded-Host    $host;
                proxy_set_header    X-Forwarded-Port    $server_port;
        }
        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/www.domain.com/fullchain.pem; # managed by Certbot, replace with the appropriate path
        ssl_certificate_key /etc/letsencrypt/live/www.domain.com/privkey.pem; # managed by Certbot, replace with the appropriate path
        ssl_dhparam /etc/ssl/dhparams4096.pem;
}

server {
        server_name domain.com;
        index index.html index.htm index.nginx-debian.html index.php;
        location / {
                proxy_pass http://127.0.0.1:8080;
                proxy_set_header    X-Real-IP           $remote_addr;
                proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
                proxy_set_header    X-Forwarded-Proto   $scheme;
                proxy_set_header    Host                $host;
                proxy_set_header    X-Forwarded-Host    $host;
                proxy_set_header    X-Forwarded-Port    $server_port;
        }
        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/domain.com/fullchain.pem; # managed by Certbot, replace with the appropriate path
        ssl_certificate_key /etc/letsencrypt/live/domain.com/privkey.pem; # managed by Certbot, replace with the appropriate path
        ssl_dhparam /etc/ssl/dhparams4096.pem;
}

server {
        if ($host = domain.com) {
        return 301 https://$host$request_uri;
        }
        listen 80;
        server_name domain.com;
        return 404;
}

server {
        if ($host = www.domain.com) {
        return 301 https://www.domain.com;
        }
        listen 80;
        server_name www.domain.com;
        return 404;
}
