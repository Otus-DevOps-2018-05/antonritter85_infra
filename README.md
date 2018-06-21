# antonritter85_infra
antonritter85 Infra repository

## Homework-3
### Задание со слайда 35:
```
ssh -o ProxyCommand='ssh -W %h:%p appuser@35.206.129.231' appuser@10.132.0.3
```

### Доп. задание со слайда 35:
В файле ~/.ssh/config на локальной машине добавляем следующиие строки:
```
#Host someinternalhost
 HostName 10.132.0.3
 User appuser
 IdentityFile ~/.ssh/appuser
 ProxyCommand ssh -W %h:%p appuser@bastion

Host bastion
 HostName 35.206.129.231
 User appuser
 IdentityFile ~/.ssh/appuser
```
Это позволит подключиться к someinternalhost командой:
```
ssh someinternalhost
```

bastion_IP = 35.206.129.231\
someinternalhost_IP = 10.132.0.3
