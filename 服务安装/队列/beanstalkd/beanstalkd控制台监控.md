# beanstalkd控制台监控


### 1.下载代码
```
cd /data/web
git clone https://github.com/ptrofimov/beanstalk_console
```

### 2.配置虚拟域名
```
server {
    listen      80;
    server_name dev.beanstalk.com;
    set         $root_path '/data/web/beanstalk_console/public';
    root        $root_path;

    #access_log  /data/logs/access/dev.api.com/access.log;

    index index.php index.html index.htm;

    try_files $uri $uri/ @rewrite;

    location @rewrite {
        rewrite ^/(.*)$ /index.php?_url=/$1;
    }

    location ~ \.php {
        # try_files    $uri =404;

        fastcgi_index  /index.php;
        fastcgi_pass   127.0.0.1:9000;

        include fastcgi_params;
        fastcgi_split_path_info       ^(.+\.php)(/.+)$;
        fastcgi_param PATH_INFO       $fastcgi_path_info;
        fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~* ^/(css|img|js|flv|swf|download)/(.+)$ {
        root $root_path;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

### 3.重启nginx
```
systemctl reload nginx
```

### 4.浏览器访问
```
http://dev.beanstalk.com
```


