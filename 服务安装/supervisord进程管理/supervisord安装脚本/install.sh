#!/bin/bash
install_dir="$PWD"

yum -y install python-setuptools
ping pypi.python.org -c 4 >/dev/null 2>&1
easy_install supervisor

# --------------------  创建相关目录  -----------------
[ ! -d "/etc/supervisord.d" ] && mkdir -p /etc/supervisord.d
[ ! -d "/data/logs/error/supervisor" ] && mkdir -p /data/logs/error/supervisor


# --------------------  调整配置文件  -----------------
if [ -e "/etc/supervisord.conf" ]; then
  mv /etc/supervisord.conf{,_backup}
  pushd ${install_dir}/config
  /bin/cp supervisord.conf /etc
  echo "${CSUCCESS}supervisor配置文件存在，已经备份处理! ${CEND}"
else
  pushd ${install_dir}/config
  /bin/cp supervisord.conf /etc
fi

# --------------------  添加启动经脚本  -----------------
pushd ${install_dir}/init.d
/bin/cp supervisord /etc/init.d

# --------------------  权限处理  -----------------
chmod +x /etc/init.d/supervisord
chkconfig supervisord on
service supervisord start
