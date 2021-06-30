### Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

### 1.

* TypeError: unsupported operand type(s) for +: 'int' and 'str'

* 
```python
#!/usr/bin/env python3

    a = 1
    b = '2'
    c = str(a) + b
```

* 
```python
#!/usr/bin/env python3

    a = 1
    b = '2'
    c = a + int(b)
```


### 2.
```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/devops-netology", "git ls-files -mo --exclude-standard"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.splitlines():
    print(os.path.abspath(result))
```


### 3.

```python
#!/usr/bin/env python3

import os

directory = input("Input directory: ")
isExist = os.path.isdir(os.path.expanduser(directory))
if isExist:
    bash_command = [f"cd {directory}", "git ls-files -mo --exclude-standard"]
    result_os = os.popen(' && '.join(bash_command)).read()
    for result in result_os.splitlines():
        print(os.path.abspath(result))
```


### 4.
```python
#!/usr/bin/env python3

import socket

service = input("Input service: ")
ip = socket.gethostbyname(service)
fname = "table.txt"

with open(fname, 'a+') as f:
    f.seek(0)
    data = f.readlines()
    service_recorded = False
    for i, line in enumerate(data):
        prev_service, prev_ip = line.rstrip().split("-")
        if service==prev_service:
            service_recorded = True
            if prev_ip != ip:
                print(f"[ERROR] {service} IP mismatch: {prev_ip} {ip}")
                data[i] = line.replace(line, f"{service}-{ip}\n")
    if not service_recorded:
        new_line = f"{service}-{ip}\n"
        print(new_line)
        data.append(new_line)
    
with open(fname, 'w') as f:
    f.writelines(data)
```




