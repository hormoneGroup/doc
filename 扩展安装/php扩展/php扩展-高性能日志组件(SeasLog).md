## php扩展-高性能日志组件(SeasLog)

### [github地址](https://github.com/Neeke/SeasLog)

### 1.安装
```
cd /data/softs/
git clone https://github.com/Neeke/SeasLog.git 
cd SeasLog
phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
```

### 2.php扩展配置
```
cd /usr/local/php/etc/php.d/
vim ext-seaslog.ini
set paste

配置文件内容

;Enable seaslog extension module
extension = seaslog.so

;默认log根目录
seaslog.default_basepath = "/data/logs/app"

;默认logger目录
seaslog.default_logger = "debug"

;日期格式配置 默认"Y-m-d H:i:s"
seaslog.default_datetime_format = "Y-m-d H:i:s"

;日志格式模板 默认"%T | %L | %P | %Q | %t | %M"
seaslog.default_template = "%M"

;是否以type分文件 1是 0否(默认)
seaslog.disting_type = 0

;是否每小时划分一个文件 1是 0否(默认)
seaslog.disting_by_hour = 0

;是否启用buffer 1是 0否(默认)
seaslog.use_buffer = 0

;buffer中缓冲数量 默认0(不使用buffer_size)
seaslog.buffer_size = 100

;记录日志级别，数字越大，根据级别记的日志越多。
;0-EMERGENCY 1-ALERT 2-CRITICAL 3-ERROR 4-WARNING 5-NOTICE 6-INFO 7-DEBUG 8-ALL
;默认8(所有日志)
;
;   注意, 该配置项自1.7.0版本开始有变动。
;   在1.7.0版本之前, 该值数字越小，根据级别记的日志越多: 
;   0-all 1-debug 2-info 3-notice 4-warning 5-error 6-critical 7-alert 8-emergency
;   1.7.0 之前的版本，该值默认为0(所有日志);
seaslog.level = 8

;日志函数调用回溯层级
;影响预定义变量 %F 中的行数
;默认0
seaslog.recall_depth = 0

;自动记录错误 默认1(开启)
seaslog.trace_error = 1

;自动记录异常信息 默认0(关闭)
seaslog.trace_exception = 0

;日志存储介质 1File 2TCP 3UDP (默认为1)
seaslog.appender = 1

;接收ip 默认127.0.0.1 (当使用TCP或UDP时必填)
seaslog.remote_host = "127.0.0.1"

;接收端口 默认514 (当使用TCP或UDP时必填)
seaslog.remote_port = 514

;过滤日志中的回车和换行符 (默认为0)
seaslog.trim_wrap = 0

;是否开启抛出SeasLog自身异常  1开启(默认) 0否
seaslog.throw_exception = 1

;是否开启忽略SeasLog自身warning  1开启(默认) 0否
seaslog.ignore_warning = 1
```

### 3.重启php-fpm
```
systemctl reload php-fpm
```
