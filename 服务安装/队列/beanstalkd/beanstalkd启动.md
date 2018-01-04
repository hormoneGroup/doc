# beanstalkd启动


### 创建beanstalkd启动用户
```
新增用户
useradd beanstalkd

创建用户密码
passwd  beanstalkd
```

### 创建beanstalkd队列数据目录
```
mkdir -p /data/components/beanstalkd_11311
```

### beanstalkd队列数据目录权限
```
chown beanstalkd.beanstalkd /data/components/beanstalkd_11311
```

### 命令行启动
```
/usr/local/bin/beanstalkd -l 0.0.0.0 -p 11311 -u beanstalkd -b /data/components/beanstalkd_11311 -s 104857600 &
```

### 通过supervisord启动

> 1.创建supervisord配置文件
```
vim /etc/supervisord.d/beanstalkd.ini
```

> 2.创建supervisord日志目录
```
mkdir -p /data/logs/error/supervisord
```

> 3.supervisord文件内容
```
[program:beanstalkd_11311]
command=/usr/local/bin/beanstalkd -l 0.0.0.0 -p 11311 -u beanstalkd -b /data/components/beanstalkd_11311 -s 104857600
user=beanstalkd                           ;执行命令的用户
;numprocs=3                               ; 启动几个进程 默认 1
process_name=%(process_num)02d
;directory=                              ; 执行前要不要先cd到目录去
autostart=true                          ; 随着supervisord的启动而启动
autorestart=true                        ; 是否自动重启 默认true
startretries=3                          ; 启动失败时的最多重试次数 默认3
;exitcodes=0                            ; 正常退出代码
;stopsignal=KILL                         ; 用来杀死进程的信号
;stopwaitsecs=10                        ; 发送SIGKILL前的等待时间
redirect_stderr=true                     ; 重定向stderr到stdout
stdout_logfile=/data/logs/error/supervisor/beanstalkd_11311_stdout.log
stderr_logfile=/data/logs/error/supervisor/beanstalkd_11311_stderr.log
```

> 4.supervisord启动beanstalkd
```
supervisorctl update
```

