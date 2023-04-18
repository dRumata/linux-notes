При попытке запустить графическую утилиту с повышением привелегий например
```bash
sudo gparted
```
Ошибка:
```console
(gpartedbin:7219): Gtk-WARNING **: 13:04:45.178: cannot open display:
```
Решение:
```bash
xhost +localhost
```
И перезайти в графическую сессию.
