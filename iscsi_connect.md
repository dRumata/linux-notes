## Устанавливаем пакеты:
### Centos
```
yum -y install iscsi-initiator-utils
systemctl start iscsid
systemctl start iscsi
```
### Debian
```
sudo apt install open-iscsi
```
### OpenSUSE
```
zypper install open-iscsi
```

## Находим таргеты
```
[root@client01 ~]# iscsiadm --mode discovery -t sendtargets --portal 192.168.1.141

192.168.1.141:3260,1 iqn.2006-01.com.openfiler:tsn.d625a0d9cb77
```
## Подключаемся к iSCSI серверу к нужной группе
```
[root@client01 ~]# iscsiadm --mode node --targetname  iqn.2006-01.com.openfiler:tsn.d625a0d9cb77  --portal 192.168.1.141 --login

  Logging in to [iface: default, target: iqn.2006-01.com.openfiler:tsn.d625a0d9cb77, portal: 192.168.1.141,3260] (multiple)
 Login to [iface: default, target: iqn.2006-01.com.openfiler:tsn.d625a0d9cb77, portal: 192.168.1.141,3260] successful.
 
[root@client01 ~]#
```
