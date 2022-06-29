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
[root@client01 ~]# iscsiadm --mode discovery -t sendtargets --portal <ISCSI_SERVER_IP>

<ISCSI_SERVER_IP>:3260,1 <iqn.TARGET_NAME>
```
## Подключаемся к iSCSI серверу к нужной группе
```
[root@client01 ~]# iscsiadm --mode node --targetname  <iqn.TARGET_NAME>  --portal <ISCSI_SERVER_IP> --login

  Logging in to [iface: default, target: <iqn.TARGET_NAME>, portal: <ISCSI_SERVER_IP>,3260] (multiple)
 Login to [iface: default, target: <iqn.TARGET_NAME>, portal: <ISCSI_SERVER_IP>,3260] successful.
 
[root@client01 ~]#
```

Проверяем наличие файлов с именами таргетов в каталоге /var/lib/iscsi/ 

Если каталоги появились, можно перейти к разметке диска, должен появится новый диск объемом созданного LUN
```
# fdisk -l
...

Диск /dev/sdc: 2 TiB, 2199023255552 байт, 536870912 секторов
Единицы: секторов по 1 * 4096 = 4096 байт
Размер сектора (логический/физический): 4096 байт / 4096 байт
Размер I/O (минимальный/оптимальный): 4096 байт / 8388608 байт
```
Создаем новый раздел (см ```man fdsik```)
```
# fdisk /dev/sdc
```
Форматируем созданный раздел (см ```man mkfs.xfs```)
```
# mkfs.xfs /dev/sdc1
```
Вносим изменения в ```/etc/fstab```
```
#echo "/dev/sdc1  /mnt/iscsi-mpoint   ext4 _netdev,rw 0 0" >> /etc/fstab
```
Провереяем монтирование
```
#mount -a
#df -h|grep sdc1

/dev/sdc1    50G         1,9G   49G            4% /mnt/iscsi-mpoint
```

