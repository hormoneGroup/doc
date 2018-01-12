# ffmpeg音频处理库安装


### 1. 目录初始化
```
mkdir -p /data/softs/ffmpeg
```

### 2. 下载安装yasm
```
cd /data/softs/ffmpeg
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar zxvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix=/usr/local/yasm
make && make install
```

### 3. 下载ffmpeg
```
cd /data/softs/ffmpeg
wget http://ffmpeg.org/releases/ffmpeg-3.4.1.tar.bz2
tar jxvf ffmpeg-3.4.1.tar.bz2
cd ffmpeg-3.4.1
./configure --prefix=/usr/local/ffmpeg --yasmexe=/usr/local/yasm/bin/yasm
make && make install
```