# antonritter85_infra
antonritter85 Infra repository

## Homework-4

### Дополнительное задание (слайд 20)

Startup скрипт файл, передаваемый команде gcloud:

```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=scripts/startupscript.sh
```

где в опции startup-script=PATH/TO/FILE - относительный путь до файла скрипта.

Вариант со startup-script-url:

```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --scopes storage-ro \
  --metadata startup-script-url=gs://antonritter85-bucket/startupscripturl.sh
  ```

### Дополнительное задание (слайд 21)

Правило firewall для работы приложения default-puma-server, созданное через команду gcloud:

```
gcloud compute firewall-rules create default-puma-server \
    --network default \
    --action allow \
    --direction ingress \
    --rules tcp:9292 \
    --source-ranges 0.0.0.0/0 \
    --target-tags puma-server
```

#### Информация для проверки

testapp_IP = 35.205.109.145
testapp_port = 9292

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

bastion_IP = 35.206.129.231
someinternalhost_IP = 10.132.0.3
