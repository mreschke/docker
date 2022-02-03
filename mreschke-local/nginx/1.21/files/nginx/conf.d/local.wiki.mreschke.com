server {
    listen 443 ssl;
    server_name local.wiki.mreschke.com;

    ssl_certificate         /etc/nginx/certs/mreschke/live/local.wiki.mreschke.com/fullchain.pem;
    ssl_certificate_key     /etc/nginx/certs/mreschke/live/local.wiki.mreschke.com/privkey.pem;

    location / {
        proxy_set_header    X-Real-IP               $remote_addr;
        proxy_set_header    X-Forwarded-For         $proxy_add_x_forwarded_for;
        proxy_set_header    X-Forwarded-Proto       $scheme;
        proxy_set_header    Host                    $host;
        proxy_set_header    Upgrade                 $http_upgrade;
        proxy_set_header    Connection              $http_connection;
        proxy_pass          http://host.docker.internal:7004;  #Uvicore port
    }
}

server {
    listen 80;
    server_name local.wiki.mreschke.com;
    return 301 https://$host$request_uri;
}
