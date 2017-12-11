## php扩展-64位自增ID生成器(DonkeyID)

### [github地址](https://github.com/osgochina/donkeyid)

### 1.安装
```
cd /data/softs/
git clone https://github.com/osgochina/donkeyid.git
cd donkeyid/donkeyid
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
```

### 2.php扩展配置
```
cd /usr/local/php/etc/php.d/
vim ext-donkeyid.ini
set paste

配置文件内容

;Enable donkeyid extension module
extension = donkeyid.so
;节点id 0-4095
donkeyid.node_id = 0
;时间戳 0-当前时间戳
donkeyid.epoch = 0
```



