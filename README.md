# CloudXNS DDNS 记录更新脚本 (Bash版)

运行该脚本前 , 请确保您的环境有以下命令/软件
```
curl
cat
awk
md5sum
date
tr
```

## 使用方法

1. 下载 `https://github.com/Diaoji/CloudXNS-DDNS_Bash/archive/master.zip`
2. 解压 zip
3. 修改解压后的 `account.txt`
4. 将解压后的 `account.txt` 和 `main.sh` 上传到 Unix/Linux 环境中 (路由器/树莓派/手机/等设备) , 两个文件必须在同一目录下
5. 给予 `main.sh` 可执行权限
6. 使用绝对路径执行 `main.sh`  For example : `root@openWrt# /opt/CloudXNS-DDNS/main.sh`

执行完后会输出相应结果 , 如显示 `Update DDNS record success` 则说明更新成功 其他问题请参考CloudXNS错误码来进行修改 `account.txt`

参考链接 : https://www.cloudxns.net/Support/lists/cid/17

## 建议

如果你的家用带宽公网IP会一直变动的话 , 将A记录的TTL修改到60 并在设备上设置cron 例如
```
[root@diaoji-pi ~]# crontab -e
*/5 * * * * /opt/CloudXNS-DDNS/main.sh <- 这个路径取决你自己修改
 ^
每5分钟 更新执行一次更新脚本
```
