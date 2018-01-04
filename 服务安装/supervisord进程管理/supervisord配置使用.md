### supervisor配置

```
cd /etc/supervisord.d
sudo vim test.ini
```

### 输入

```
[program:test]
command=/usr/bin/php cli.php test index ;执行命令
user=www-data                   ;执行命令的用户
numprocs=3                      ; 启动几个进程 默认 1
process_name=%(process_num)02d
;directory=                     ; 执行前要不要先cd到目录去
autostart=true                  ; 随着supervisord的启动而启动
autorestart=true                ; 是否自动重启 默认true
startretries=3                  ; 启动失败时的最多重试次数 默认3
;exitcodes=0                    ; 正常退出代码
;stopsignal=KILL                ; 用来杀死进程的信号
;stopwaitsecs=10                ; 发送SIGKILL前的等待时间
redirect_stderr=true            ; 重定向stderr到stdout
stdout_logfile=/data/logs/error/supervisor/test_stdout.log
stderr_logfile=/data/logs/error/supervisor/test_stderr.log
```


### 常用命令
```
supervisorctl ;进入控制台
status  ;查看当前状态
restart all ;重启所有
stop all ;停止所有
start all ;启动所有
restart test:* ;重启test分组 
```

