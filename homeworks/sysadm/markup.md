### Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"

#### 1. Исправить JSON.
```json
    {
       "info":"Sample JSON output from our service\t",
       "elements":[
          {
             "name":"first",
             "type":"server",
             "ip":"7.1.7.5"
          },
          {
             "name":"second",
             "type":"proxy",
             "ip":"71.78.22.43"
          }
       ]
    }
```

#### 2. Написать скрипт.

JSON:

Предполагаемый формат, генерируемый на выходе:

``` {"services": [{"mail.google.com": "172.217.16.133"}, {"google.com": "172.217.18.110"}, {"drive.google.com": "142.250.185.206"}]} ```

```python
import os
import json
import socket

data = {"services": []}

new_service = input("Input service: ")

detected_ip = socket.gethostbyname(new_service)

fname = "services.json"
flag = False

with open(fname, 'a+') as f:
    if os.stat(fname).st_size != 0:
        f.seek(0)
        data = json.load(f)
        for ind, value in enumerate(data["services"]):
            service = list(value)[0]
            if new_service == service and not flag:  # если название сервиса в файле найдено
                flag = True  # тогда flag
                if detected_ip != data["services"][ind][service]:  # если ip обновился
                    data["services"][ind][service] = detected_ip
    if not flag or os.stat(fname).st_size == 0:
        data["services"].append({new_service: detected_ip})

with open(fname, 'w') as f:
    json.dump(data, f)

```

YAML:

Предполагаемый формат, генерируемый на выходе:

```
services:
- google.com: 172.217.18.110
- mail.google.com: 172.217.16.133
- drive.google.com: 142.250.185.206
```


```python
import yaml

data = {"services": []}

new_service = input("Input service: ")

detected_ip = socket.gethostbyname(new_service)

fname = "services.yaml"
flag = False

with open(fname, 'a+') as f:
    if os.stat(fname).st_size != 0:
        f.seek(0)
        data = yaml.safe_load(f)
        for ind, value in enumerate(data["services"]):
            service = list(value)[0]
            if new_service == service and not flag:
                flag = True
                if detected_ip != data["services"][ind][service]:
                    data["services"][ind][service] = detected_ip
    if not flag or os.stat(fname).st_size == 0:
        data["services"].append({new_service: detected_ip})

with open(fname, 'w') as f:
    yaml.dump(data, f)
```