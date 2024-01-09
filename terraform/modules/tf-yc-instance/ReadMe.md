This module defines the major parameters oth th VM to be created, it also outputs its public and private IPs.

Some parameters can be tuned up in "variables.tf" file:

- "disk_size" defines hard drive size in Gb, default is 6 Gb
- "CPUs_in_use"  defines a type of CPU will be used (see https://cloud.yandex.ru/ru/docs/compute/concepts/vm-platforms for details). The default value is "standard-v1"
-"VM_name" defines a name of Virtual Machine, default value is"chapter5-lesson2-std-024-07"
- "core_number" defines a number of CPU cores, default value is 2
- "RAM_size" defines RAM size in Gb, default 2 Gb
- "preemptible_VM" a boolean variable, defines what kind of sustainability of VM needed (see https://cloud.google.com/compute/docs/instances/for more on preemptible policy). Default value is "yes"
- "os_family" defines a Linux release type, default value is "ubuntu-2004-lts"


