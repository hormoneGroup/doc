## php扩展-phalcon框架

### [github地址](https://github.com/phalcon/cphalcon)

### 1.安装
```
cd /data/softs/
git clone git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install --phpize /usr/local/php/bin/phpize --php-config /usr/local/php/bin/php-config
```

### 2.php扩展配置
```
cd /usr/local/php/etc/php.d/
vim ext-phalcon.ini
set paste

配置文件内容
;Enable phalcon extension module
extension = phalcon.so
```

### 3.重启php-fpm
```
systemctl reload php-fpm
```


